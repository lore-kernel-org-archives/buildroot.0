From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 06:13:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/irda-utils
Message-ID: <20090126061307.E1D1D77458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 06:13:06 +0000 (Mon, 26 Jan 2009)
New Revision: 25043

Log:
irda-utils: totally broken packages should depend on BROKEN, not DEPRECATED

Or we should simply delete the dir.

Modified:
   trunk/buildroot/package/irda-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/irda-utils/Config.in
===================================================================
--- trunk/buildroot/package/irda-utils/Config.in	2009-01-26 05:51:31 UTC (rev 25042)
+++ trunk/buildroot/package/irda-utils/Config.in	2009-01-26 06:13:06 UTC (rev 25043)
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_IRDA_UTILS
 	bool "irda_utils"
-	depends on BR2_DEPRECATED
+	depends on BROKEN
 	help
 	  Tools for accessing the irda-Subsystem of the Linux-Kernel
 	  The makefile is totally broken.
@@ -41,5 +41,5 @@
 	help
 		Some Toshiba Laptops have buggy BIOSes which didn't initialize
 		Irda. This may help those.
-	
+
 endif
