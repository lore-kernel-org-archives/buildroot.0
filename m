From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Jan 2008 05:31:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080103133127.3C4251200FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-03 05:31:26 -0800 (Thu, 03 Jan 2008)
New Revision: 20700

Log:
busybox: Get rid of minor version selection.

There isn't much point in selecting anything else than the latest
in a stable release series, so merge all the 1.7.x options into a
single selection.



Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-01-03 12:13:42 UTC (rev 20699)
+++ trunk/buildroot/package/busybox/Config.in	2008-01-03 13:31:26 UTC (rev 20700)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_7_2
+	default BR2_BUSYBOX_VERSION_1_7_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -24,17 +24,9 @@
 		bool "BusyBox 1.6.1"
 		depends on BR2_DEPRECATED
 
-	config BR2_BUSYBOX_VERSION_1_7_0
-		bool "BusyBox 1.7.0"
-		depends on BR2_DEPRECATED || BR2_RECENT
+	config BR2_BUSYBOX_VERSION_1_7_X
+		bool "BusyBox 1.7.x"
 
-	config BR2_BUSYBOX_VERSION_1_7_1
-		bool "BusyBox 1.7.1"
-		depends on BR2_DEPRECATED || BR2_RECENT
-
-	config BR2_BUSYBOX_VERSION_1_7_2
-		bool "BusyBox 1.7.2"
-
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -44,9 +36,7 @@
 	string
 	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
-	default "1.7.0"		if BR2_BUSYBOX_VERSION_1_7_0
-	default "1.7.1"		if BR2_BUSYBOX_VERSION_1_7_1
-	default "1.7.2"		if BR2_BUSYBOX_VERSION_1_7_2
+	default "1.7.2"		if BR2_BUSYBOX_VERSION_1_7_X
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -68,9 +58,7 @@
 	default "target/device/x86/i386/busybox.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_1
-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_2
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
