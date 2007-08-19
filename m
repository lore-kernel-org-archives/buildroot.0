From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 16:16:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: diffutils distcc
	freetype
Message-ID: <20070819231647.5601AA60F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 16:16:47 -0700 (Sun, 19 Aug 2007)
New Revision: 19583

Log:
Update configs for distcc, diffutils and freetype

Modified:
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2007-08-19 23:13:06 UTC (rev 19582)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2007-08-19 23:16:47 UTC (rev 19583)
@@ -19,6 +19,7 @@
 
 $(DIFFUTILS_DIR)/.unpacked: $(DL_DIR)/$(DIFFUTILS_SOURCE)
 	$(DIFFUTILS_CAT) $(DL_DIR)/$(DIFFUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(DIFFUTILS_DIR)/config
 	touch $(DIFFUTILS_DIR)/.unpacked
 
 $(DIFFUTILS_DIR)/.configured: $(DIFFUTILS_DIR)/.unpacked
@@ -108,6 +109,8 @@
 
 diffutils: uclibc $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
 
+diff-utils-unpacked:	$(DIFFUTILS_DIR)/.unpacked
+
 diffutils-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) uninstall
 	-$(MAKE) -C $(DIFFUTILS_DIR) clean

Modified: trunk/buildroot/package/distcc/distcc.mk
===================================================================
--- trunk/buildroot/package/distcc/distcc.mk	2007-08-19 23:13:06 UTC (rev 19582)
+++ trunk/buildroot/package/distcc/distcc.mk	2007-08-19 23:16:47 UTC (rev 19583)
@@ -18,6 +18,7 @@
 
 $(DISTCC_DIR)/.unpacked: $(DL_DIR)/$(DISTCC_SOURCE)
 	$(DISTCC_CAT) $(DL_DIR)/$(DISTCC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(DISTCC_DIR)
 	touch $(DISTCC_DIR)/.unpacked
 
 $(DISTCC_DIR)/.configured: $(DISTCC_DIR)/.unpacked

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-08-19 23:13:06 UTC (rev 19582)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-08-19 23:16:47 UTC (rev 19583)
@@ -16,6 +16,7 @@
 
 $(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(FREETYPE_DIR)
 	touch $(FREETYPE_DIR)/.unpacked
 
 # freetype for the target
