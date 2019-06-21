From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 21 Jun 2019 14:37:08 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/4] allow results to be filtered
 by symbols
Message-ID: <20190621123712.8060-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch provides a better support for interaction with the autobuild
database.

The patch is composed of 4 commits that add the following changes:
 - Update internal sql query (func.inc.php) to allow requests on symbols.
 - Update the index.php page to parse read symbols from GET with the syntax 
   `symbols[BR2_INIT_SYSTEMD]=y`
 - Update the database schema by adding indexes on the two columns of  
   `symbol_per_result` to improve queries that involve specific symbols.
   Also mark these columns as foreign keys to ensure integrity of the database.
 - Add a new page which consist a basic form to ease searching in the database.

This patch is a v1 and there are probably many issue to fix, so any suggestion
concerning functionnalities/coding style are welcome -- especially as it is an
ugly php script and an even more ugly javascript.


Victor Huesca (4):
  web/{funcs,db}.inc.php: add support for symbols in sql query
  web/index.php: add support for symbols to be passed via GET
  web/schema.sql: add indexes on the database schema
  web/request.{js,php} and web/stylesheet.css: new page to ease seaching
    for specific results

 web/db.inc.php     | 28 ++++++++++++++--
 web/funcs.inc.php  | 48 ++++++++++++++++++++++------
 web/index.php      | 25 ++++++++++++---
 web/request.js     | 47 +++++++++++++++++++++++++++
 web/request.php    | 67 +++++++++++++++++++++++++++++++++++++++
 web/schema.sql     |  7 +++-
 web/stylesheet.css | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 284 insertions(+), 17 deletions(-)
 create mode 100644 web/request.js
 create mode 100644 web/request.php

-- 
2.21.0
