From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:17:03 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 0/4] allow results to be
 filtered by symbols
In-Reply-To: <20190621123712.8060-1-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
Message-ID: <20190708081707.28348-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This second version fix a stupid typo in a function called causing the footer to
not display as excepted.


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
