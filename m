From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Fri, 1 Aug 2014 15:53:18 +0530
Subject: [Buildroot] [PATCH] gnuplot: libgd linking against libpthread
Message-ID: <1406888598-2546-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gnuplot is linked, pass -lpthread agrument to link
libgd against libpthread when the support for gd is enabled.

fixes:
http://autobuild.buildroot.net/results/f62/f62f29619d4dbf3264a4243ef6cd89f9a8d73140//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 ...nuplot-0003-link-libgd-against-libpthread.patch |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/gnuplot/gnuplot-0003-link-libgd-against-libpthread.patch

diff --git a/package/gnuplot/gnuplot-0003-link-libgd-against-libpthread.patch b/package/gnuplot/gnuplot-0003-link-libgd-against-libpthread.patch
new file mode 100644
index 0000000..6447f48
--- /dev/null
+++ b/package/gnuplot/gnuplot-0003-link-libgd-against-libpthread.patch
@@ -0,0 +1,16 @@
+Link libgd against libpthread.
+When gnuplot is linked, pass the -lpthread argument.
+
+Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+---
+diff -Nurp gnuplot-4.6.2_orig/configure.in gnuplot-4.6.2/configure.in
+--- gnuplot-4.6.2_orig/configure.in	2014-08-01 14:20:01.891274820 +0530
++++ gnuplot-4.6.2/configure.in	2014-08-01 14:23:12.603266835 +0530
+@@ -590,6 +590,7 @@ if test "$with_gd" != no; then
+        [AC_DEFINE(HAVE_GD_PNG,1,[ Define if libgd supports png. ])
+         libgd_LIBS="$libgd_LIBS -lpng"])
+      LIBS="$_libs"
++     LIBS="-lpthread $LIBS"
+ 
+     ],[dnl gd library not found
+        AC_MSG_WARN([libgd not found or too old, version >= 2.0 is required])
-- 
1.7.9.5
