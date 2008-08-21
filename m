From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 22:08:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080821050854.534363C2BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 22:08:53 -0700 (Wed, 20 Aug 2008)
New Revision: 23130

Log:
busybox: add 1.12.x and make it default

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-08-20 23:30:42 UTC (rev 23129)
+++ trunk/buildroot/package/busybox/Config.in	2008-08-21 05:08:53 UTC (rev 23130)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_11_X
+	default BR2_BUSYBOX_VERSION_1_12_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -43,6 +43,9 @@
 	config BR2_BUSYBOX_VERSION_1_11_X
 		bool "BusyBox 1.11.x"
 
+	config BR2_BUSYBOX_VERSION_1_12_X
+		bool "BusyBox 1.12.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -57,6 +60,7 @@
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.1"	if BR2_BUSYBOX_VERSION_1_11_X
+	default "1.12.0"	if BR2_BUSYBOX_VERSION_1_12_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
@@ -82,6 +86,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_9_X
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_10_X
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_11_X
+	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
