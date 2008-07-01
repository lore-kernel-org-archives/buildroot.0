From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 07:04:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080701140456.CC91B3C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 07:04:55 -0700 (Tue, 01 Jul 2008)
New Revision: 22593

Log:
busybox: default to 1.11.x

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-07-01 13:58:01 UTC (rev 22592)
+++ trunk/buildroot/package/busybox/Config.in	2008-07-01 14:04:55 UTC (rev 22593)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_10_X
+	default BR2_BUSYBOX_VERSION_1_11_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -34,10 +34,11 @@
 
 	config BR2_BUSYBOX_VERSION_1_9_X
 		bool "BusyBox 1.9.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_10_X
 		bool "BusyBox 1.10.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
 	config BR2_BUSYBOX_VERSION_1_11_X
 		bool "BusyBox 1.11.x"
