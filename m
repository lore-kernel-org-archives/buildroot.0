From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Feb 2008 05:39:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: alsa-lib
	alsa-utils fbset imagemagick
Message-ID: <20080219133926.B313612C745@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-19 05:39:25 -0800 (Tue, 19 Feb 2008)
New Revision: 21067

Log:
buildroot: add missing -source targets


Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/fbset/fbset.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-02-19 12:10:18 UTC (rev 21066)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2008-02-19 13:39:25 UTC (rev 21067)
@@ -64,6 +64,8 @@
 
 alsa-lib: uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 
+alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
+
 alsa-lib-clean:
 	rm -f $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 	-$(MAKE) -C $(ALSA_LIB_DIR) clean

Modified: trunk/buildroot/package/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/alsa-utils/alsa-utils.mk	2008-02-19 12:10:18 UTC (rev 21066)
+++ trunk/buildroot/package/alsa-utils/alsa-utils.mk	2008-02-19 13:39:25 UTC (rev 21067)
@@ -73,6 +73,8 @@
 
 alsa-utils: uclibc alsa-lib ncurses $(TARGET_DIR)/$(ALSA_UTILS_TARGET_BINARY)
 
+alsa-utils-source: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
+
 alsa-utils-clean:
 	for file in $(ALSA_UTILS_TARGETS_y); do \
 		rm -f $(TARGET_DIR)/$$file; \

Modified: trunk/buildroot/package/fbset/fbset.mk
===================================================================
--- trunk/buildroot/package/fbset/fbset.mk	2008-02-19 12:10:18 UTC (rev 21066)
+++ trunk/buildroot/package/fbset/fbset.mk	2008-02-19 13:39:25 UTC (rev 21067)
@@ -30,6 +30,8 @@
 
 fbset: uclibc $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 
+fbset-source: $(DL_DIR)/$(FBSET_SOURCE)
+
 fbset-clean:
 	rm -f $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 	-$(MAKE) -C $(FBSET_DIR) clean

Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2008-02-19 12:10:18 UTC (rev 21066)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2008-02-19 13:39:25 UTC (rev 21067)
@@ -131,6 +131,8 @@
 		$(IMAGEMAGICK_DIR)/.libinstall \
 		$(IMAGEMAGICK_TARGET_BINARIES)
 
+imagemagick-source: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
+
 imagemagick-clean:
 	rm -f $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/usr/bin/animate
