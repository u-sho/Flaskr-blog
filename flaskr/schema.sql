from __future__ import with_statement
from contextlib import closing
from flaskr import init_db

drop table if exists entries;
create table entries (
  id integer primary key autoincrement,
  title string not null,
  text string not null
);

sqlite3 /tmp/flaskr.db < schema.sql

def init_db():
    with closing(connect_db()) as db:
        with app.open_resource('schema.sql') as f:
            db.cursor().executescript(f.read())
        db.commit()
        
init_db()
