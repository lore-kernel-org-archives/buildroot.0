From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 09:58:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070920165837.B78FA3004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 09:58:35 -0700 (Thu, 20 Sep 2007)
New Revision: 19916

Log:
- bump version


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-20 16:51:59 UTC (rev 19915)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-20 16:58:35 UTC (rev 19916)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_6_0
+	default BR2_BUSYBOX_VERSION_1_7_1
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -54,10 +54,15 @@
 
 	config BR2_BUSYBOX_VERSION_1_6_1
 		bool "BusyBox 1.6.1"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_7_0
 		bool "BusyBox 1.7.0"
+		depends on BR2_DEPRECATED
 
+	config BR2_BUSYBOX_VERSION_1_7_1
+		bool "BusyBox 1.7.1"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -76,6 +81,7 @@
 	default "1.6.0"		if BR2_BUSYBOX_VERSION_1_6_0
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.0"		if BR2_BUSYBOX_VERSION_1_7_0
+	default "1.7.1"		if BR2_BUSYBOX_VERSION_1_7_1
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -106,6 +112,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
+	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_7_1
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
