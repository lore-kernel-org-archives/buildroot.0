From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 16:08:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20081228160857.E48AE76D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 16:08:57 +0000 (Sun, 28 Dec 2008)
New Revision: 24578

Log:
openssl: fix uclibc 0.9.30 build

Added:
   trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch


Changeset:
Added: trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch	2008-12-28 16:08:57 UTC (rev 24578)
@@ -0,0 +1,18 @@
+sys/timeb.h / ftime are legacy, so don't enable them for uClibc 
+---
+ apps/speed.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: openssl-0.9.8g/apps/speed.c
+===================================================================
+--- openssl-0.9.8g.orig/apps/speed.c
++++ openssl-0.9.8g/apps/speed.c
+@@ -113,7 +113,7 @@
+ #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
+ # define TIMES
+ #endif
+-#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
++#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
+ # define TIMEB
+ #endif
+ 
