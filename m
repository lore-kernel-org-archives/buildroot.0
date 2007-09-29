From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 14:06:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXfont
Message-ID: <20070929210633.019CA30043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 14:06:33 -0700 (Sat, 29 Sep 2007)
New Revision: 20129

Log:
- remove SUSv3 LEGACY function


Added:
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch


Changeset:
Added: trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch	2007-09-29 21:06:33 UTC (rev 20129)
@@ -0,0 +1,12 @@
+diff -urN xlib_libXfont-1.2.7.orig/src/builtins/file.c xlib_libXfont-1.2.7/src/builtins/file.c
+--- xlib_libXfont-1.2.7.orig/src/builtins/file.c        2007-01-17 23:49:10.000000000 +0200
++++ xlib_libXfont-1.2.7/src/builtins/file.c     2007-09-30 00:52:55.000000000 +0300
+@@ -50,7 +50,7 @@
+     len = BUFFILESIZE;
+     if (len > left)
+        len = left;
+-    bcopy (io->file->bits + io->offset, f->buffer, len);
++    memmove (f->buffer, io->file->bits + io->offset, len);
+     io->offset += len;
+     f->left = len - 1;
+     f->bufp = f->buffer + 1;
