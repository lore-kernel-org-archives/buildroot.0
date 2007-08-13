From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 13:10:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20070813201038.DAA7CA6853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 13:10:36 -0700 (Mon, 13 Aug 2007)
New Revision: 19492

Log:
Include header file defining MB_CUR_MAX to TinyX

Added:
   trunk/buildroot/package/tinyx/tinyx-011010-MB_CUR_MAX.patch


Changeset:
Added: trunk/buildroot/package/tinyx/tinyx-011010-MB_CUR_MAX.patch
===================================================================
--- trunk/buildroot/package/tinyx/tinyx-011010-MB_CUR_MAX.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyx/tinyx-011010-MB_CUR_MAX.patch	2007-08-13 20:10:36 UTC (rev 19492)
@@ -0,0 +1,11 @@
+diff -urN xc-011010-0rig/lib/X11/lcGenConv.c xc-011010/lib/X11/lcGenConv.c
+--- xc-011010-0rig/lib/X11/lcGenConv.c	2001-08-15 13:54:21.000000000 +0200
++++ xc-011010/lib/X11/lcGenConv.c	2007-08-13 12:55:18.000000000 +0200
+@@ -48,6 +48,7 @@
+  * Platforms: all systems.
+  */
+ 
++#include <stdlib.h>
+ #include "Xlibint.h"
+ #include "XlcGeneric.h"
+ #include <stdio.h>
