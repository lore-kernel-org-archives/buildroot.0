From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 19:51:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090225195142.3A26E7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 19:51:41 +0000 (Wed, 25 Feb 2009)
New Revision: 25455

Log:
php: Config.ext is in a BR2_PACKAGE_PHP conditional, so get rid of depends

Hunks missing from r25406.

Modified:
   trunk/buildroot/package/php/Config.ext


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2009-02-25 14:28:49 UTC (rev 25454)
+++ trunk/buildroot/package/php/Config.ext	2009-02-25 19:51:41 UTC (rev 25455)
@@ -51,73 +51,65 @@
 
 config BR2_PACKAGE_PHP_EXT_EXIF
 	bool "EXIF"
-	depends on BR2_PACKAGE_PHP
 	help
 	  EXIF support
 
 config BR2_PACKAGE_PHP_EXT_FTP
 	bool "FTP"
-	depends on BR2_PACKAGE_PHP
 	help
 	  FTP Support
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_GETTEXT
+	depends on BR2_PACKAGE_GETTEXT
 	help
 	  gettext support
 
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "gmp"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBGMP
+	depends on BR2_PACKAGE_LIBGMP
 	help
 	  GMP support
 
 config BR2_PACKAGE_PHP_EXT_JSON
 	bool "JSON"
-	depends on BR2_PACKAGE_PHP
 	help
 	  JSON support
 
 config BR2_PACKAGE_PHP_EXT_READLINE
 	bool "readline"
-	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_READLINE
+	depends on (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_READLINE
 	help
 	  readline support
 
 config BR2_PACKAGE_PHP_EXT_NCURSES
 	bool "ncurses"
-	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_NCURSES
+	depends on (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_NCURSES
 	help
 	  ncurses support
 
 config BR2_PACKAGE_PHP_EXT_SYSVMSG
 	bool "sysvmsg - System V Message queue"
-	depends on BR2_PACKAGE_PHP
 	help
 	  System V Message queue support
 
 config BR2_PACKAGE_PHP_EXT_SYSVSEM
 	bool "sysvsem - System V Semaphores"
-	depends on BR2_PACKAGE_PHP
 	help
 	  System V Sempahore support
 
 config BR2_PACKAGE_PHP_EXT_SYSVSHM
 	bool "sysvshm - System V Shared memory"
-	depends on BR2_PACKAGE_PHP
 	help
 	  System V Shared memory support
 
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
-	depends on BR2_PACKAGE_PHP
 	help
 	  Zip Support
 
 config BR2_PACKAGE_PHP_EXT_FILTER
 	bool "filter"
-	depends on BR2_PACKAGE_PHP
 	help
 	  Input filter support
 
@@ -125,34 +117,32 @@
 
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "sqlite"
-	depends on BR2_PACKAGE_PHP
 	default y
 	help
 	  SQLite
 
 config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
 	bool "sqlite UTF8 support"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_SQLITE
+	depends on BR2_PACKAGE_PHP_EXT_SQLITE
 	help
 	  UTF8 Support for sqlite
 
 config BR2_PACKAGE_PHP_EXT_PDO
 	bool "PDO"
-	depends on BR2_PACKAGE_PHP
 	default y
 	help
 	  PDO support
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "PDO_SQLite"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_PDO
+	depends on BR2_PACKAGE_PHP_EXT_PDO
 	default y
 	help
 	  SQLite support for PDO
 
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "PDO_MySQL"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_PDO
+	depends on BR2_PACKAGE_PHP_EXT_PDO
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  MySQL support for PDO
