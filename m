From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 20:45:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libconfuse
Message-ID: <20090121204512.4928A768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 20:45:10 +0000 (Wed, 21 Jan 2009)
New Revision: 24944

Log:
libconfuse: fix build by removing -Werror flag

Added:
   trunk/buildroot/package/libconfuse/libconfuse-2.6-dont-use-werror.patch


Changeset:
Added: trunk/buildroot/package/libconfuse/libconfuse-2.6-dont-use-werror.patch
===================================================================
--- trunk/buildroot/package/libconfuse/libconfuse-2.6-dont-use-werror.patch	                        (rev 0)
+++ trunk/buildroot/package/libconfuse/libconfuse-2.6-dont-use-werror.patch	2009-01-21 20:45:10 UTC (rev 24944)
@@ -0,0 +1,34 @@
+confuse: don't compile with -Werror
+
+Werror isn't really a robust setting for !development.
+---
+ src/Makefile.am |    2 +-
+ src/Makefile.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: confuse-2.6/src/Makefile.am
+===================================================================
+--- confuse-2.6.orig/src/Makefile.am
++++ confuse-2.6/src/Makefile.am
+@@ -10,7 +10,7 @@
+ DEFS = -DLOCALEDIR=\"$(localedir)\" @DEFS@
+ 
+ if cc_is_gcc
+-AM_CFLAGS=-Wall -Werror
++AM_CFLAGS=-Wall
+ endif
+ 
+ LIBS = @LIBS@
+Index: confuse-2.6/src/Makefile.in
+===================================================================
+--- confuse-2.6.orig/src/Makefile.in
++++ confuse-2.6/src/Makefile.in
+@@ -196,7 +196,7 @@
+ libconfuse_la_SOURCES = confuse.c lexer.l
+ libconfuse_la_LIBADD = $(LTLIBINTL)
+ include_HEADERS = confuse.h
+- at cc_is_gcc_TRUE@AM_CFLAGS = -Wall -Werror
++ at cc_is_gcc_TRUE@AM_CFLAGS = -Wall
+ CLEANFILES = *~ \#*\#
+ AM_LFLAGS = -Pcfg_yy -olex.yy.c
+ all: all-am
