From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Jun 2008 00:22:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080626072220.4DB66F8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-26 00:22:19 -0700 (Thu, 26 Jun 2008)
New Revision: 22516

Log:
kernel headers: bump 2.6.25.x

Based on patch by Fathi Boudra.


Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-26 06:51:16 UTC (rev 22515)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-26 07:22:19 UTC (rev 22516)
@@ -137,6 +137,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.6"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.25.9"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch	2008-06-26 06:51:16 UTC (rev 22515)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch	2008-06-26 07:22:19 UTC (rev 22516)
@@ -1,24 +0,0 @@
-[PATCH] export linux/a.out.h
-
-Export linux/a.out.h like we do for asm/a.out.h. One minor complication is
-that the interesting stuff is protected by an CONFIG_ARCH_SUPPORTS_AOUT ifdef,
-so make sure this gets defined for unifdef.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/linux/Kbuild |    2 ++
- 1 file changed, 2 insertions(+)
-
-Index: linux-2.6.25.6/include/linux/Kbuild
-===================================================================
---- linux-2.6.25.6.orig/include/linux/Kbuild
-+++ linux-2.6.25.6/include/linux/Kbuild
-@@ -159,6 +159,8 @@
- header-y += videotext.h
- header-y += x25.h
- 
-+UNIFDEF += -DCONFIG_ARCH_SUPPORTS_AOUT
-+unifdef-y += a.out.h
- unifdef-y += acct.h
- unifdef-y += adb.h
- unifdef-y += adfs_fs.h

Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch (from rev 22515, trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch	2008-06-26 07:22:19 UTC (rev 22516)
@@ -0,0 +1,24 @@
+[PATCH] export linux/a.out.h
+
+Export linux/a.out.h like we do for asm/a.out.h. One minor complication is
+that the interesting stuff is protected by an CONFIG_ARCH_SUPPORTS_AOUT ifdef,
+so make sure this gets defined for unifdef.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/linux/Kbuild |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: linux-2.6.25.6/include/linux/Kbuild
+===================================================================
+--- linux-2.6.25.6.orig/include/linux/Kbuild
++++ linux-2.6.25.6/include/linux/Kbuild
+@@ -159,6 +159,8 @@
+ header-y += videotext.h
+ header-y += x25.h
+ 
++UNIFDEF += -DCONFIG_ARCH_SUPPORTS_AOUT
++unifdef-y += a.out.h
+ unifdef-y += acct.h
+ unifdef-y += adb.h
+ unifdef-y += adfs_fs.h
