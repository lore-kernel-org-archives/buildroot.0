From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 10:41:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070920174124.676A5A688C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 10:41:21 -0700 (Thu, 20 Sep 2007)
New Revision: 19919

Log:
- add candidate-patch to make fakeroot UCLIBC_HAS_LFS aware


Added:
   trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff


Changeset:
Added: trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff	                        (rev 0)
+++ trunk/buildroot/package/fakeroot/fakeroot-uclibc-LFS.diff	2007-09-20 17:41:21 UTC (rev 19919)
@@ -0,0 +1,13 @@
+diff -u fakeroot-1.7.1.orig/communicate.h fakeroot-1.7.1/communicate.h
+--- fakeroot-1.7.1.orig/communicate.h	2005-10-02 17:35:36.000000000 +0200
++++ fakeroot-1.7.1/communicate.h	2007-09-20 19:36:52.000000000 +0200
+@@ -35,7 +35,8 @@
+ #endif
+ 
+ /* Then decide whether we do or do not use the stat64 support */
+-#if defined(sun) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1)
++#if defined(sun) || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1) \
++ || (defined __UCLIBC__ && defined UCLIBC_HAS_LFS)
+ # define STAT64_SUPPORT
+ #else
+ # warning Not using stat64 support
