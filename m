From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 05:50:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070930125025.68B9E30044@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 05:50:25 -0700 (Sun, 30 Sep 2007)
New Revision: 20143

Log:
- bump version


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-30 12:48:25 UTC (rev 20142)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-30 12:50:25 UTC (rev 20143)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_7_1
+	default BR2_BUSYBOX_VERSION_1_7_2
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -30,7 +30,11 @@
 
 	config BR2_BUSYBOX_VERSION_1_7_1
 		bool "BusyBox 1.7.1"
+		depends on BR2_DEPRECATED
 
+	config BR2_BUSYBOX_VERSION_1_7_2
+		bool "BusyBox 1.7.2"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -42,6 +46,7 @@
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.0"		if BR2_BUSYBOX_VERSION_1_7_0
 	default "1.7.1"		if BR2_BUSYBOX_VERSION_1_7_1
+	default "1.7.2"		if BR2_BUSYBOX_VERSION_1_7_2
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -65,6 +70,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_1
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_2
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
