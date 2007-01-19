From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 08:23:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070119162336.0715748585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 08:23:35 -0800 (Fri, 19 Jan 2007)
New Revision: 17382

Log:
- remove superfluous intermediate target


Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-01-19 14:54:58 UTC (rev 17381)
+++ trunk/buildroot/package/udev/udev.mk	2007-01-19 16:23:35 UTC (rev 17382)
@@ -29,12 +29,9 @@
 $(UDEV_DIR)/.unpacked: $(DL_DIR)/$(UDEV_SOURCE)
 	$(UDEV_CAT) $(DL_DIR)/$(UDEV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UDEV_DIR) package/udev \*.patch
-	touch $(UDEV_DIR)/.unpacked
+	touch $@
 
-$(UDEV_DIR)/.configured: $(UDEV_DIR)/.unpacked
-	touch $(UDEV_DIR)/.configured
-
-$(UDEV_DIR)/$(UDEV_BINARY): $(UDEV_DIR)/.configured
+$(UDEV_DIR)/$(UDEV_BINARY): $(UDEV_DIR)/.unpacked
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC)\
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
