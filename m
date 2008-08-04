From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:06:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080804190619.5F2293C851@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:06:19 -0700 (Mon, 04 Aug 2008)
New Revision: 23015

Log:
busybox: default HIDE_OTHERS to y for all versions

There's no particular reason to only enable BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
by default for the snapshot version.

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-08-04 19:06:10 UTC (rev 23014)
+++ trunk/buildroot/package/busybox/Config.in	2008-08-04 19:06:19 UTC (rev 23015)
@@ -91,7 +91,7 @@
 config BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 	bool "Hide applications that are provided by busybox"
 	depends on BR2_PACKAGE_BUSYBOX
-	default y if BR2_PACKAGE_BUSYBOX_SNAPSHOT
+	default y
 	help
 	  Do not show packages in menuconfig that are potentially provided
 	  by busybox.
