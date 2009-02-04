From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 12:47:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:  target
Message-ID: <20090204124714.586BB7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 12:47:13 +0000 (Wed, 04 Feb 2009)
New Revision: 25234

Log:
buildroot: move BR2_ROOTFS_{PREFIX,SUFFIX} to target menu

As suggested on the list by Thiago - Makes more sense to have this together
with the stuff using it.

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/target/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-02-04 00:01:07 UTC (rev 25233)
+++ trunk/buildroot/Config.in	2009-02-04 12:47:13 UTC (rev 25234)
@@ -116,18 +116,6 @@
 	  build_ARCH -> build_ARCH_[SUFFIX]
 	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX]
 
-config BR2_ROOTFS_PREFIX
-	string "Custom root fs prefix"
-	default "rootfs"
-	help
-	  Add a custom string to the beginning of the root file system name.
-
-config BR2_ROOTFS_SUFFIX
-	string "Custom root fs suffix"
-	default ""
-	help
-	  Add a custom string to the end of the root file system name.
-
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"

Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2009-02-04 00:01:07 UTC (rev 25233)
+++ trunk/buildroot/target/Config.in	2009-02-04 12:47:13 UTC (rev 25234)
@@ -1,5 +1,17 @@
 menu "Target filesystem options"
 
+config BR2_ROOTFS_PREFIX
+	string "Custom root fs prefix"
+	default "rootfs"
+	help
+	  Add a custom string to the beginning of the root file system name.
+
+config BR2_ROOTFS_SUFFIX
+	string "Custom root fs suffix"
+	default ""
+	help
+	  Add a custom string to the end of the root file system name.
+
 comment "filesystem for target device"
 
 source "target/cramfs/Config.in"
