From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 23:01:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080723060151.51F803C827@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 23:01:50 -0700 (Tue, 22 Jul 2008)
New Revision: 22925

Log:
busybox: additional 1.11.1 fix

Added:
   trunk/buildroot/package/busybox/busybox-1.11.1-modutils.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.11.1-modutils.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.1-modutils.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.1-modutils.patch	2008-07-23 06:01:50 UTC (rev 22925)
@@ -0,0 +1,12 @@
+--- busybox-1.11.1/modutils/insmod.c	Wed Jun 25 14:51:18 2008
++++ busybox-1.11.1-modutils/modutils/insmod.c	Wed Jul 23 00:46:08 2008
+@@ -840,7 +840,8 @@
+ 				ElfW(RelM) *rel, ElfW(Addr) v)
+ {
+ #if defined(__arm__) || defined(__i386__) || defined(__mc68000__) \
+- || defined(__sh__) || defined(__s390__) || defined(__x86_64__)
++ || defined(__sh__) || defined(__s390__) || defined(__x86_64__) \
++ || defined(__powerpc__) || defined(__mips__)
+ 	struct arch_file *ifile = (struct arch_file *) f;
+ #endif
+ 	enum obj_reloc ret = obj_reloc_ok;
