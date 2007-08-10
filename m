From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri, 10 Aug 2007 11:53:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20070810185336.76CBAA4656@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-08-10 11:53:34 -0700 (Fri, 10 Aug 2007)
New Revision: 19423

Log:
fixup compile


Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-08-10 14:44:48 UTC (rev 19422)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-08-10 18:53:34 UTC (rev 19423)
@@ -5,6 +5,7 @@
 #############################################################
 TIFF_VERSION:=3.8.2
 TIFF_SOURCE:=tiff_$(TIFF_VERSION).orig.tar.gz
+TIFF_SOURCE2:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_SITE:=http://ftp.debian.org/pool/main/t/tiff/
 TIFF_DIR:=$(BUILD_DIR)/tiff-$(TIFF_VERSION)
 TIFF_CAT:=$(ZCAT)
@@ -16,6 +17,7 @@
 
 $(TIFF_DIR)/.unpacked: $(DL_DIR)/$(TIFF_SOURCE)
 	$(TIFF_CAT) $(DL_DIR)/$(TIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(TIFF_CAT) $(TIFF_DIR)/$(TIFF_SOURCE2) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(TIFF_DIR) package/tiff/ tiff\*.patch
 	$(CONFIG_UPDATE) $(TIFF_DIR)
 	$(CONFIG_UPDATE) $(TIFF_DIR)/config
