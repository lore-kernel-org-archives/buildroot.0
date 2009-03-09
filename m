From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 09:53:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [25582] trunk/buildroot/package/e2fsprogs
Message-ID: <20090309095337.D5886764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 09:53:37 +0000 (Mon, 09 Mar 2009)
New Revision: 25582

Log:
e2fsprogs: needs LARGEFILE

Modified:
   trunk/buildroot/package/e2fsprogs/Config.in


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/Config.in
===================================================================
--- trunk/buildroot/package/e2fsprogs/Config.in	2009-03-09 04:38:37 UTC (rev 25581)
+++ trunk/buildroot/package/e2fsprogs/Config.in	2009-03-09 09:53:37 UTC (rev 25582)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
+	depends on BR2_LARGEFILE
 	help
 	  The EXT2 file system utilities and libraries
 
@@ -80,3 +81,5 @@
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
 
+comment "e2fsprogs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
