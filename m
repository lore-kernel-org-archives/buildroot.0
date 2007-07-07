From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 16:54:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070707235433.CB010A67F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 16:54:33 -0700 (Sat, 07 Jul 2007)
New Revision: 19023

Log:
- forgot to adjust the path


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-07-07 18:17:41 UTC (rev 19022)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-07-07 23:54:33 UTC (rev 19023)
@@ -1,7 +1,5 @@
-Index: test/mmap/mmap2.c
-===================================================================
---- test/mmap/mmap2.c	(revision 0)
-+++ test/mmap/mmap2.c	(revision 18616)
+--- uClibc-0.9.29.oorig/test/mmap/mmap2.c	(revision 0)
++++ uClibc-0.9.29/test/mmap/mmap2.c	(revision 18616)
 @@ -0,0 +1,41 @@
 +/* When trying to map /dev/mem with offset 0xFFFFF000 on the ARM platform, mmap
 + * returns -EOVERFLOW.
@@ -44,10 +42,8 @@
 +    close(fd);
 +    return 0;
 +}
-Index: libc/sysdeps/linux/arm/mmap.c
-===================================================================
---- libc/sysdeps/linux/arm/mmap.c	(revision 18615)
-+++ libc/sysdeps/linux/arm/mmap.c	(revision 18616)
+--- uClibc-0.9.29.oorig/libc/sysdeps/linux/arm/mmap.c	(revision 18615)
++++ uClibc-0.9.29/libc/sysdeps/linux/arm/mmap.c	(revision 18616)
 @@ -27,7 +27,6 @@ __ptr_t mmap(__ptr_t addr, size_t len, i
  
  #elif defined  (__NR_mmap2)
@@ -75,10 +71,8 @@
  }
  #elif defined (__NR_mmap)
  # define __NR__mmap __NR_mmap
-Index: libc/sysdeps/linux/common/mmap64.c
-===================================================================
---- libc/sysdeps/linux/common/mmap64.c	(revision 18615)
-+++ libc/sysdeps/linux/common/mmap64.c	(revision 18616)
+--- uClibc-0.9.29.oorig/libc/sysdeps/linux/common/mmap64.c	(revision 18615)
++++ uClibc-0.9.29/libc/sysdeps/linux/common/mmap64.c	(revision 18616)
 @@ -58,8 +58,13 @@ __ptr_t mmap64(__ptr_t addr, size_t len,
  		__set_errno(EINVAL);
  		return MAP_FAILED;
