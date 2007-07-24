From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 24 Jul 2007 07:08:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
Message-ID: <20070724140805.CE7F8A6055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-24 07:08:02 -0700 (Tue, 24 Jul 2007)
New Revision: 19247

Log:
Bump ImageMagick version

Modified:
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-24 14:06:13 UTC (rev 19246)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-24 14:08:02 UTC (rev 19247)
@@ -3,7 +3,7 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_VERSION:=6.3.4
+IMAGEMAGICK_VERSION:=6.3.5
 IMAGEMAGICK_SOURCE:=ImageMagick.tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
@@ -16,7 +16,7 @@
 
 $(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 	$(IMAGEMAGICK_CAT) $(DL_DIR)/$(IMAGEMAGICK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-\*.patch\*
 	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
 	touch $@
 
