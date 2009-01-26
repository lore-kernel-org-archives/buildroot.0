From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:13:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/modutils
Message-ID: <20090126001330.249E676D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:13:29 +0000 (Mon, 26 Jan 2009)
New Revision: 25037

Log:
Deprecate modutils, only for ancient 2.4 kernels

Modified:
   trunk/buildroot/package/modutils/Config.in


Changeset:
Modified: trunk/buildroot/package/modutils/Config.in
===================================================================
--- trunk/buildroot/package/modutils/Config.in	2009-01-26 00:12:47 UTC (rev 25036)
+++ trunk/buildroot/package/modutils/Config.in	2009-01-26 00:13:29 UTC (rev 25037)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MODUTILS
 	bool "modutils"
 	depends on !BR2_PACKAGE_MODULE_INIT_TOOLS
+	depends on BR2_DEPRECATED
 	help
 	  The modutils packages includes the kerneld program for automatic
 	  loading and unloading of modules, as well as other module
