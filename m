From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 19:05:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090302190534.6CD9F7656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 19:05:33 +0000 (Mon, 02 Mar 2009)
New Revision: 25489

Log:
php: bump version

Fixes Fixes CVE-2008-5498, closes #137.

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-03-02 16:12:00 UTC (rev 25488)
+++ trunk/buildroot/package/php/php.mk	2009-03-02 19:05:33 UTC (rev 25489)
@@ -3,7 +3,7 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.8
+PHP_VER:=5.2.9
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://www.php.net/distributions
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
@@ -144,7 +144,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CC=$(TARGET_CC) \
-		./configure $(DISABLE_NLS) \
+		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
