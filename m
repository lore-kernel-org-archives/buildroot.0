From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 19 Aug 2019 11:00:35 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 0/3] add a new page to
 simplify build results filtering
Message-ID: <20190819090038.28808-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides a new page to ease the search in the autobuild
database. This page consist on a simple HTML from covering all
available GET parameters.


A javascript page is associated to the request form in order to handle
configuration symbols. This script simply hook the submit function to
parse symbols and create the right arguments. It also remove empty
fields to keep a nice URL (eg. for sharing a search).


Changes v1 --> v2:
 - This patch is now separated from the configuration symbols 
   patch-series
 - Add a link to the request page in the footer
 - Rework the style-sheet to be cleaner
 - Change the javascript to create the format the URL instead of using 
   hacks to remove empty fields


Victor Huesca (3):
  web/request: new page to help making request to the autobuild database
  web/stylesheet.css: add styling for the request page
  web/func.inc.php: add a link to the request page in the footer

 web/funcs.inc.php  |  1 +
 web/request.js     | 69 ++++++++++++++++++++++++++++++++++++
 web/request.php    | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 web/stylesheet.css | 64 +++++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 web/request.js
 create mode 100644 web/request.php

-- 
2.21.0
