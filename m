From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  6 Feb 2007 08:23:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070206162333.4FE314869A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-06 08:23:33 -0800 (Tue, 06 Feb 2007)
New Revision: 17791

Log:
CONFIG_PREFIX hack (r17670) no longer needed

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:20:29 UTC (rev 17790)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:23:33 UTC (rev 17791)
@@ -132,7 +132,7 @@
 ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		CONFIG_PREFIX="$(TARGET_DIR)" ARCH=$(KERNEL_ARCH) \
+		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
