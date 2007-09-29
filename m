From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 16:32:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXfont
Message-ID: <20070929233240.736B7A45E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 16:32:39 -0700 (Sat, 29 Sep 2007)
New Revision: 20135

Log:
- add a hopefully not whitespace-damaged patch, second take. (Ivan Kuten)


Added:
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-susv3-legacy.patch

Removed:
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch


Changeset:
Deleted: trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch	2007-09-29 23:26:52 UTC (rev 20134)
+++ trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch	2007-09-29 23:32:39 UTC (rev 20135)
@@ -1,12 +0,0 @@
-diff -urN xlib_libXfont-1.2.7.orig/src/builtins/file.c xlib_libXfont-1.2.7/src/builtins/file.c
---- xlib_libXfont-1.2.7.orig/src/builtins/file.c        2007-01-17 23:49:10.000000000 +0200
-+++ xlib_libXfont-1.2.7/src/builtins/file.c     2007-09-30 00:52:55.000000000 +0300
-@@ -50,7 +50,7 @@
-     len = BUFFILESIZE;
-     if (len > left)
-        len = left;
--    bcopy (io->file->bits + io->offset, f->buffer, len);
-+    memmove (f->buffer, io->file->bits + io->offset, len);
-     io->offset += len;
-     f->left = len - 1;
-     f->bufp = f->buffer + 1;

Added: trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-susv3-legacy.patch	2007-09-29 23:32:39 UTC (rev 20135)
@@ -0,0 +1,12 @@
+diff -urN xlib_libXfont-1.2.7.orig/src/builtins/file.c xlib_libXfont-1.2.7/src/builtins/file.c
+--- xlib_libXfont-1.2.7.orig/src/builtins/file.c	2007-01-17 23:49:10.000000000 +0200
++++ xlib_libXfont-1.2.7/src/builtins/file.c	2007-09-30 03:09:29.000000000 +0300
+@@ -50,7 +50,7 @@
+     len = BUFFILESIZE;
+     if (len > left)
+ 	len = left;
+-    bcopy (io->file->bits + io->offset, f->buffer, len);
++    memmove (f->buffer, io->file->bits + io->offset, len);
+     io->offset += len;
+     f->left = len - 1;
+     f->bufp = f->buffer + 1;
