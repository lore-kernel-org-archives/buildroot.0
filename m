From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 21 Aug 2007 07:27:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070821142759.744EBA60E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-21 07:27:57 -0700 (Tue, 21 Aug 2007)
New Revision: 19617

Log:
Use $(BZCAT) instead of bzcat

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 14:20:59 UTC (rev 19616)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 14:27:57 UTC (rev 19617)
@@ -27,7 +27,7 @@
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
 	mkdir	-p $(PROJECT_BUILD_DIR)/patches
-	bzcat package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
+	$(BZCAT) package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
 		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch
 	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
