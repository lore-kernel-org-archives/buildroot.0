From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Feb 2009 21:55:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090220215533.2515176564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-20 21:55:32 +0000 (Fri, 20 Feb 2009)
New Revision: 25404

Log:
php: use alternative download URL so we can use DOWNLOAD macro

As noted by Solar on IRC.

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-02-20 15:13:50 UTC (rev 25403)
+++ trunk/buildroot/package/php/php.mk	2009-02-20 21:55:32 UTC (rev 25404)
@@ -5,7 +5,7 @@
 #############################################################
 PHP_VER:=5.2.8
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
-PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
+PHP_SITE:=http://www.php.net/distributions
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
 PHP_CAT=$(BZCAT)
 PHP_DEPS=
@@ -126,7 +126,7 @@
 endif
 
 $(DL_DIR)/$(PHP_SOURCE):
-	$(WGET) -P $(DL_DIR) $(PHP_SITE)
+	$(call DOWNLOAD,$(PHP_SITE),$(PHP_SOURCE))
 
 php-source: $(DL_DIR)/$(PHP_SOURCE)
 
