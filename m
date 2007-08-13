From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 13:07:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20070813200733.E01DCA682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 13:07:31 -0700 (Mon, 13 Aug 2007)
New Revision: 19491

Log:
Allow use of uclibc string routines in TinyX

Added:
   trunk/buildroot/package/tinyx/tinyx-011010-strings.patch


Changeset:
Added: trunk/buildroot/package/tinyx/tinyx-011010-strings.patch
===================================================================
--- trunk/buildroot/package/tinyx/tinyx-011010-strings.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyx/tinyx-011010-strings.patch	2007-08-13 20:07:31 UTC (rev 19491)
@@ -0,0 +1,13 @@
+diff -urN xc-011010-0rig/include/Xfuncs.h xc-011010/include/Xfuncs.h
+--- xc-011010-0rig/include/Xfuncs.h	2001-07-25 17:04:42.000000000 +0200
++++ xc-011010/include/Xfuncs.h	2007-08-13 13:08:39.000000000 +0200
+@@ -45,6 +45,9 @@
+ #include <strings.h>
+ /* bcopy, bcmp, bzero declared */
+ #define _XFUNCS_H_INCLUDED_STRING_H
++#elif defined(__UCLIBC__)
++#include <string.h>
++#define _XFUNCS_H_INCLUDED_STRING_H
+ #else
+ #include <string.h>
+ #define _XFUNCS_H_INCLUDED_STRING_H
