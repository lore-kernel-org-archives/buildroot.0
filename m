From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 14:20:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package/openssl
	target/u-boot toolchain etc...
Message-ID: <20090118142020.2738A77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-18 14:20:18 +0000 (Sun, 18 Jan 2009)
New Revision: 24901

Log:
Kconfig: remove 'default n' and 'default no' (see r22874)

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/openssl/Config.in
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-18 10:57:23 UTC (rev 24900)
+++ trunk/buildroot/Config.in	2009-01-18 14:20:18 UTC (rev 24901)
@@ -182,7 +182,6 @@
 
 config BR2_CONFIG_CACHE
 	bool "Use a central configure cache file"
-	default n
 	help
 	  This determines if a central config cache is used by
 	  packages, reducing the configure time for packages as each

Modified: trunk/buildroot/package/openssl/Config.in
===================================================================
--- trunk/buildroot/package/openssl/Config.in	2009-01-18 10:57:23 UTC (rev 24900)
+++ trunk/buildroot/package/openssl/Config.in	2009-01-18 14:20:18 UTC (rev 24901)
@@ -12,7 +12,6 @@
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	depends on BR2_PACKAGE_OPENSSL
-	default no
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
@@ -20,6 +19,5 @@
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
 	depends on BR2_PACKAGE_OPENSSL
-	default no
 	help
 	  Install additional encryption engine libraries.

Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-18 10:57:23 UTC (rev 24900)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-18 14:20:18 UTC (rev 24901)
@@ -360,5 +360,3 @@
 	default y if BR2_BOOTSOURCE_FLASH
 	default y if BR2_BOOTSOURCE_SDCARD
 	default y if BR2_BOOTSOURCE_EEPROM
-	default n
-

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2009-01-18 10:57:23 UTC (rev 24900)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2009-01-18 14:20:18 UTC (rev 24901)
@@ -101,7 +101,6 @@
 
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
-	default n
 	select BR2_PACKAGE_MAKE
 	help
 	  Enabling this option will compile and install the uClibc test suite.
