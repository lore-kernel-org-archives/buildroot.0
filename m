From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 03:03:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20070723100315.3081CA65CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 03:03:14 -0700 (Mon, 23 Jul 2007)
New Revision: 19212

Log:
Update config for tiff package

Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-07-23 09:45:23 UTC (rev 19211)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-07-23 10:03:14 UTC (rev 19212)
@@ -18,6 +18,7 @@
 	$(TIFF_CAT) $(DL_DIR)/$(TIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(TIFF_DIR) package/tiff/ tiff\*.patch
 	$(CONFIG_UPDATE) $(TIFF_DIR)
+	$(CONFIG_UPDATE) $(TIFF_DIR)/config
 	touch $(TIFF_DIR)/.unpacked
 
 $(TIFF_DIR)/.configured: $(TIFF_DIR)/.unpacked
