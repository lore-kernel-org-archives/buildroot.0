From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  3 Jul 2008 19:57:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080704025714.5B6BE3C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-03 19:57:13 -0700 (Thu, 03 Jul 2008)
New Revision: 22622

Log:
Fix freetype-2.2.1 build in AVR32, possibly other platforms too

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-07-04 02:23:19 UTC (rev 22621)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-07-04 02:57:13 UTC (rev 22622)
@@ -18,10 +18,11 @@
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ \*.patch
 	$(CONFIG_UPDATE) $(FREETYPE_DIR)
+	$(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
 	touch $@
 
 $(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
-	(cd $(FREETYPE_DIR) && \
+	(cd $(FREETYPE_DIR);  rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
