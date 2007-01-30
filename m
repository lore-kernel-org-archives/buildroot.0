From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 30 Jan 2007 08:47:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070130164728.8C72B48580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-30 08:47:27 -0800 (Tue, 30 Jan 2007)
New Revision: 17670

Log:
busybox 1.4.0 seems to use CONFIG_PREFIX instead of PREFIX

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-01-30 13:37:21 UTC (rev 17669)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-01-30 16:47:27 UTC (rev 17670)
@@ -116,7 +116,7 @@
 ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		ARCH=$(KERNEL_ARCH) \
+		CONFIG_PREFIX="$(TARGET_DIR)" ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
