From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 17 Aug 2008 06:46:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20080817134646.682263C729@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-17 06:46:46 -0700 (Sun, 17 Aug 2008)
New Revision: 23100

Log:
speex: also compile static libraries

Modified:
   trunk/buildroot/package/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2008-08-17 13:46:42 UTC (rev 23099)
+++ trunk/buildroot/package/speex/speex.mk	2008-08-17 13:46:46 UTC (rev 23100)
@@ -11,8 +11,9 @@
 SPEEX_INSTALL_TARGET = YES
 SPEEX_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 SPEEX_DEPENDENCIES = libogg
-SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib --with-ogg-includes=$(STAGING_DIR)/usr/include \
-		--disable-static --enable-fixed-point $(DISABLE_NLS)
+SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
+		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
+		 --enable-fixed-point $(DISABLE_NLS)
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
 	SPEEX_CONF_OPT += --enable-arm4-asm
