From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 16 Nov 2008 23:40:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081117074015.2FD553C870@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-16 23:40:14 -0800 (Sun, 16 Nov 2008)
New Revision: 24070

Log:
busybox: updated 1.13.0 id patch (only error out if needed)

Modified:
   trunk/buildroot/package/busybox/busybox-1.13.0-id.patch


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.13.0-id.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	2008-11-17 03:31:47 UTC (rev 24069)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-id.patch	2008-11-17 07:40:14 UTC (rev 24070)
@@ -1,14 +1,16 @@
 --- busybox-1.13.0/coreutils/id.c	Wed Nov  5 22:39:54 2008
-+++ busybox-1.13.0-id/coreutils/id.c	Sun Nov 16 15:59:46 2008
-@@ -17,6 +17,12 @@
++++ busybox-1.13.0-id/coreutils/id.c	Mon Nov 17 01:10:04 2008
+@@ -17,6 +17,14 @@
  
  #include "libbb.h"
  
++#if !ENABLE_USE_BB_PWD_GRP
 +#if defined(__UCLIBC_MAJOR__) && (__UCLIBC_MAJOR__ == 0)
 +#if (__UCLIBC_MINOR__ < 9) || (__UCLIBC_MINOR__ == 9 &&  __UCLIBC_SUBLEVEL__ < 30)
 +#error "Sorry, you need@least uClibc version 0.9.30 for id applet to build"
 +#endif
 +#endif
++#endif
 +
  enum {
  	PRINT_REAL      = (1 << 0),
