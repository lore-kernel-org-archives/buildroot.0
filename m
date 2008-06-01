From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 12:42:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080601194216.988BB3C86A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 12:42:14 -0700 (Sun, 01 Jun 2008)
New Revision: 22167

Log:
Add missing depends


Modified:
   trunk/buildroot/package/php/Config.ext
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2008-06-01 19:28:44 UTC (rev 22166)
+++ trunk/buildroot/package/php/Config.ext	2008-06-01 19:42:14 UTC (rev 22167)
@@ -145,6 +145,7 @@
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "sqlite"
 	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_SQLITE
 	default y
 	help
 	  SQLite
@@ -173,6 +174,7 @@
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "PDO_MySQL"
 	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_PDO
+	select BR2_PACKAGE_MYSQL_CLIENT
 	default n
 	help
 	  MySQL support for PDO

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2008-06-01 19:28:44 UTC (rev 22166)
+++ trunk/buildroot/package/php/php.mk	2008-06-01 19:42:14 UTC (rev 22167)
@@ -109,6 +109,7 @@
 ### Database extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 	PHP_CONFIGURE+=--with-sqlite
+	PHP_DEPS+=sqlite
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
 	PHP_CONFIGURE+=--enable-sqlite-utf8
 endif
