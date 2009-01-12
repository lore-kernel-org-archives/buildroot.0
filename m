From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:42:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
Message-ID: <20090112074210.8876D766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:42:09 +0000 (Mon, 12 Jan 2009)
New Revision: 24781

Log:
Bump version of ImageMagick which does not work, use versioned patches, needs further work to complete build

Modified:
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2009-01-12 07:40:08 UTC (rev 24780)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2009-01-12 07:42:09 UTC (rev 24781)
@@ -3,8 +3,8 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_VERSION:=6.3.7
-IMAGEMAGICK_SOURCE:=ImageMagick.tar.bz2
+IMAGEMAGICK_VERSION:=6.4.8-4
+IMAGEMAGICK_SOURCE:=ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 IMAGEMAGICK_CAT:=$(BZCAT)
@@ -28,7 +28,7 @@
 
 $(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 	$(IMAGEMAGICK_CAT) $(DL_DIR)/$(IMAGEMAGICK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-\*.patch\*
+	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
 	touch $@
 
@@ -133,6 +133,8 @@
 
 imagemagick-source: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 
+imagemagick-unpacked:$(IMAGEMAGICK_DIR)/.unpacked
+
 imagemagick-clean:
 	rm -f $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/usr/bin/animate
