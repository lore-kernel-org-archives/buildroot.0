From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 21 Mar 2008 10:56:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080321175600.D6C1A3C31A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-21 10:56:00 -0700 (Fri, 21 Mar 2008)
New Revision: 21440

Log:
confusing busybox config option description patch, busybox can be built as shared libs, hardlinks ... etc. rename to full install. Patch from Nigel Kukard

Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-03-21 11:21:02 UTC (rev 21439)
+++ trunk/buildroot/package/busybox/Config.in	2008-03-21 17:56:00 UTC (rev 21440)
@@ -49,13 +49,13 @@
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 
 
-config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
-	bool "Install symlinks for BusyBox applets"
+config BR2_PACKAGE_BUSYBOX_FULLINSTALL
+	bool "Run BusyBox's own full installation"
 	depends BR2_PACKAGE_BUSYBOX
 	default y
 	help
-	  If you want to automatically install symlinks for all the
-	  supported applets to the busybox binary, then answer Y.
+	  If you want to run BusyBox's own full install for the
+	  configured applets, then answer Y.
 
 	  This may overwrite files from other packages if your
 	  busybox includes replacement applets for the package.

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2008-03-21 11:21:02 UTC (rev 21439)
+++ trunk/buildroot/package/busybox/busybox.mk	2008-03-21 17:56:00 UTC (rev 21440)
@@ -112,7 +112,7 @@
 endif
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
-ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)
+ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
