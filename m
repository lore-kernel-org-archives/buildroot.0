From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 23:14:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070813061416.A3D5AA65E0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 23:14:15 -0700 (Sun, 12 Aug 2007)
New Revision: 19482

Log:
Add dependency to linux-fusion, if DirectFB is built with multi

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-08-13 00:12:49 UTC (rev 19481)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-08-13 06:14:15 UTC (rev 19482)
@@ -13,8 +13,10 @@
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_MULTI:=--enable-multi
+DIRECTFB_FUSION:=linux-fusion
 else
 DIRECTFB_MULTI:=
+DIRECTFB_FUSION:=
 endif
 
 $(DL_DIR)/$(DIRECTFB_SOURCE):
@@ -95,7 +97,8 @@
 		$(TARGET_DIR)/usr/lib/libdirect.so \
 		$(TARGET_DIR)/usr/lib/libfusion.so
 
-directfb: uclibc jpeg libpng freetype libsysfs tslib $(TARGET_DIR)/usr/lib/libdirectfb.so
+directfb: uclibc jpeg libpng freetype libsysfs tslib $(DIRECTFB_FUSION) \
+		$(TARGET_DIR)/usr/lib/libdirectfb.so
 
 directfb-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
