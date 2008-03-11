From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 12:31:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20080311193146.C939012015B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-11 12:31:44 -0700 (Tue, 11 Mar 2008)
New Revision: 21308

Log:
fakeroot: update patch for 1.9.3

Patch by Sunil Gupta.


Modified:
   trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	2008-03-11 19:28:06 UTC (rev 21307)
+++ trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.patch	2008-03-11 19:31:44 UTC (rev 21308)
@@ -1,14 +1,14 @@
-diff -u fakeroot-1.8.10.orig/communicate.h fakeroot-1.8.10/communicate.h
---- fakeroot-1.8.10.orig/communicate.h  2007-11-20 21:56:53.000000000 -0500
-+++ fakeroot-1.8.10/communicate.h       2007-12-13 11:00:03.000000000 -0500
+diff -urN fakeroot-1.9.3.orig/communicate.h fakeroot-1.9.3/communicate.h
+--- fakeroot-1.9.3.orig/communicate.h	2008-03-11 09:42:05.000000000 -0400
++++ fakeroot-1.9.3/communicate.h	2008-03-11 10:58:10.000000000 -0400
 @@ -35,7 +35,9 @@
  #endif
  
  /* Then decide whether we do or do not use the stat64 support */
 -#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
 +#if (defined(sun) && !defined(__SunOS_5_5_1) && !defined(_LP64)) \
-+       || (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
-+       || (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
++    || (!defined __UCLIBC__ && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1))) \
++    || (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
  # define STAT64_SUPPORT
  #else
- # warning Not using stat64 support
+ # warning Not using stat64 support
\ No newline at end of file
