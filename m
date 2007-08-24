From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Aug 2007 07:23:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070824142354.976DEA680A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-24 07:23:53 -0700 (Fri, 24 Aug 2007)
New Revision: 19686

Log:
- add busybox-1.7.0


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-08-24 14:18:47 UTC (rev 19685)
+++ trunk/buildroot/package/busybox/Config.in	2007-08-24 14:23:53 UTC (rev 19686)
@@ -55,6 +55,9 @@
 	config BR2_BUSYBOX_VERSION_1_6_1
 		bool "BusyBox 1.6.1"
 
+	config BR2_BUSYBOX_VERSION_1_7_0
+		bool "BusyBox 1.7.0"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -72,6 +75,7 @@
 	default "1.5.1"		if BR2_BUSYBOX_VERSION_1_5_1
 	default "1.6.0"		if BR2_BUSYBOX_VERSION_1_6_0
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
+	default "1.7.0"		if BR2_BUSYBOX_VERSION_1_7_0
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -101,6 +105,7 @@
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
@@ -123,3 +128,8 @@
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
 
+#config BR2_PACKAGE_BUSYBOX_INITRAMFS
+#	bool "initramfs perusing busybox"
+#	depends on BR2_PACKAGE_BUSYBOX
+#	help
+#	  Build small initramfs perusing busybox.
