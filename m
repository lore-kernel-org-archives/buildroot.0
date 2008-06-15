From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 12:17:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080615191716.A2F503C919@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 12:17:14 -0700 (Sun, 15 Jun 2008)
New Revision: 22354

Log:
kernel-headers: 2.6.25.6: export linux/a.out.h (E.G. for valgrind)


Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch


Changeset:
Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.6-export-linux-aout.patch	2008-06-15 19:17:14 UTC (rev 22354)
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
