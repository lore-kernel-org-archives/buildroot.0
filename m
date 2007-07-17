From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:06:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070717120602.5711830064@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:06:01 -0700 (Tue, 17 Jul 2007)
New Revision: 19130

Log:
Update configure files for libdaemon

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-07-17 12:04:36 UTC (rev 19129)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-07-17 12:06:01 UTC (rev 19130)
@@ -25,6 +25,7 @@
 $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
+	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
 	touch $(LIBDAEMON_DIR)/.unpacked
 
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
