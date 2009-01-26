From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:12:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/irda-utils
Message-ID: <20090126001248.7B942775D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:12:47 +0000 (Mon, 26 Jan 2009)
New Revision: 25036

Log:
Deprecate irda-utils, makefile totally broken

Modified:
   trunk/buildroot/package/irda-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/irda-utils/Config.in
===================================================================
--- trunk/buildroot/package/irda-utils/Config.in	2009-01-26 00:12:02 UTC (rev 25035)
+++ trunk/buildroot/package/irda-utils/Config.in	2009-01-26 00:12:47 UTC (rev 25036)
@@ -1,7 +1,9 @@
 menuconfig BR2_PACKAGE_IRDA_UTILS
 	bool "irda_utils"
+	depends on BR2_DEPRECATED
 	help
-		Tools for accessing the irda-Subsystem of the Linux-Kernel
+	  Tools for accessing the irda-Subsystem of the Linux-Kernel
+	  The makefile is totally broken.
 
 if BR2_PACKAGE_IRDA_UTILS
 config IRDA_IRATTACH
