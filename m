From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 17 Apr 2007 08:48:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070417154810.B3E3048604@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-17 08:48:09 -0700 (Tue, 17 Apr 2007)
New Revision: 18476

Log:
- make it compile if LFS was turned off


Added:
   trunk/buildroot/package/mdadm/mdadm-2.6.1-002.uclibc-not-lfs-fixup.patch


Changeset:
Added: trunk/buildroot/package/mdadm/mdadm-2.6.1-002.uclibc-not-lfs-fixup.patch
===================================================================
--- trunk/buildroot/package/mdadm/mdadm-2.6.1-002.uclibc-not-lfs-fixup.patch	                        (rev 0)
+++ trunk/buildroot/package/mdadm/mdadm-2.6.1-002.uclibc-not-lfs-fixup.patch	2007-04-17 15:48:09 UTC (rev 18476)
@@ -0,0 +1,13 @@
+diff -rdup mdadm-2.6.1-001/mdadm.h mdadm-2.6.1/mdadm.h
+--- mdadm-2.6.1-001/mdadm.h	2007-04-17 17:41:04.000000000 +0200
++++ mdadm-2.6.1/mdadm.h	2007-04-17 17:38:43.000000000 +0200
+@@ -388,6 +388,9 @@ struct stat64;
+ #  undef HAVE_FTW
+ #  undef HAVE_NFTW
+ # endif
++# ifndef __UCLIBC_HAS_LFS__
++#  define lseek64 lseek
++# endif
+ #endif
+ 
+ #ifdef __dietlibc__
