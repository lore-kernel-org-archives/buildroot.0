From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  6 Jan 2009 11:59:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20090106115956.4E71876BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-06 11:59:55 +0000 (Tue, 06 Jan 2009)
New Revision: 24696

Log:
openssl: remove uclibc-susv3-legacy hunk from avr32 patch

Modified:
   trunk/buildroot/package/openssl/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32


Changeset:
Modified: trunk/buildroot/package/openssl/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32	2009-01-06 05:51:34 UTC (rev 24695)
+++ trunk/buildroot/package/openssl/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32	2009-01-06 11:59:55 UTC (rev 24696)
@@ -321,15 +321,6 @@
 ===================================================================
 --- openssl-0.9.8g.orig/apps/speed.c	2008-09-24 11:00:04.000000000 +0200
 +++ openssl-0.9.8g/apps/speed.c	2008-09-24 11:01:01.000000000 +0200
-@@ -113,7 +113,7 @@
- #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
- # define TIMES
- #endif
--#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
-+#if !defined(OPENSSL_SYS_NEWLIB) && !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
- # define TIMEB
- #endif
- 
 @@ -237,6 +237,11 @@
   */
  
