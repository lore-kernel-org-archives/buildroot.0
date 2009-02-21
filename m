From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 21 Feb 2009 09:06:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090221090649.216D976564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-21 09:06:48 +0000 (Sat, 21 Feb 2009)
New Revision: 25406

Log:
php: Config.ext is in a BR2_PACKAGE_PHP conditional, so get rid of depends

Modified:
   trunk/buildroot/package/php/Config.ext


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2009-02-21 09:06:43 UTC (rev 25405)
+++ trunk/buildroot/package/php/Config.ext	2009-02-21 09:06:48 UTC (rev 25406)
@@ -2,54 +2,49 @@
 
 config BR2_PACKAGE_PHP_EXT_SOCKETS
 	bool "socket"
-	depends on BR2_PACKAGE_PHP
 	help
 	  Sockets support
 
 config BR2_PACKAGE_PHP_EXT_POSIX
 	bool "posix"
-	depends on BR2_PACKAGE_PHP
 	default y
 	help
 	  POSIX support
 
 config BR2_PACKAGE_PHP_EXT_SPL
 	bool "SPL"
-	depends on BR2_PACKAGE_PHP
 	default y
 	help
 	  SPL support
 
 config BR2_PACKAGE_PHP_EXT_SESSION
 	bool "Session"
-	depends on BR2_PACKAGE_PHP
 	default y
 	help
 	  Session support
 
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_OPENSSL
 	help
 	  openssl support
 
 config BR2_PACKAGE_PHP_EXT_LIBXML2
 	bool "xml2"
-	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBXML2
 	default y
 	help
 	  xml support
 
 config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 	bool "simplexml"
-	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
 	  SimpleXML support
 
 config BR2_PACKAGE_PHP_EXT_ZLIB
         bool "zlib"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_ZLIB
+        depends on BR2_PACKAGE_ZLIB
         default y
         help
           zlib support
