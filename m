From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 19:20:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20090121192014.4FEE0768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 19:20:13 +0000 (Wed, 21 Jan 2009)
New Revision: 24942

Log:
directfb: fix compilation error on ppc (linux/config.h is long gone)

Added:
   trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch


Changeset:
Added: trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch
===================================================================
--- trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch	2009-01-21 19:20:13 UTC (rev 24942)
@@ -0,0 +1,17 @@
+---
+ lib/direct/ppcasm_memcpy_cachable.S |    2 --
+ 1 file changed, 2 deletions(-)
+
+Index: DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
+===================================================================
+--- DirectFB-1.2.7.orig/lib/direct/ppcasm_memcpy_cachable.S
++++ DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
+@@ -34,8 +34,6 @@
+ 
+ #define __ASSEMBLY__
+ 
+-#include <linux/config.h>
+-
+ #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
+ #define L1_CACHE_LINE_SIZE       16
+ #define LG_L1_CACHE_LINE_SIZE     4 
