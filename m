From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Jan 2008 05:33:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080103133328.8287C12010C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-03 05:33:28 -0800 (Thu, 03 Jan 2008)
New Revision: 20704

Log:
busybox: Bump version to 1.9.0



Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:25 UTC (rev 20703)
+++ trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:28 UTC (rev 20704)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_8_X
+	default BR2_BUSYBOX_VERSION_1_9_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -30,7 +30,11 @@
 
 	config BR2_BUSYBOX_VERSION_1_8_X
 		bool "BusyBox 1.8.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
+	config BR2_BUSYBOX_VERSION_1_9_X
+		bool "BusyBox 1.9.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -42,6 +46,7 @@
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.4"		if BR2_BUSYBOX_VERSION_1_7_X
 	default "1.8.2"		if BR2_BUSYBOX_VERSION_1_8_X
+	default "1.9.0"		if BR2_BUSYBOX_VERSION_1_9_X
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
@@ -65,6 +70,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_X
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_8_X
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_9_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
