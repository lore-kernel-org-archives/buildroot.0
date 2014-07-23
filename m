From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 23 Jul 2014 11:58:23 +0530
Subject: [Buildroot] [PATCH] gnuplot: link libgd against libpthread when gd
	enabled
Message-ID: <1406096903-2666-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gnuplot is linked, pass -lpthread agrument to link
libgd against libpthread when the support for gd is enabled.

fixes:
http://autobuild.buildroot.net/results/148/14846b8d1a054409d1cee9f3ce1413f08b4c3634//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 ...uplot-4.6.2-link-libgd-against-libpthread.patch |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/gnuplot/gnuplot-4.6.2-link-libgd-against-libpthread.patch

diff --git a/package/gnuplot/gnuplot-4.6.2-link-libgd-against-libpthread.patch b/package/gnuplot/gnuplot-4.6.2-link-libgd-against-libpthread.patch
new file mode 100644
index 0000000..c704dc4
--- /dev/null
+++ b/package/gnuplot/gnuplot-4.6.2-link-libgd-against-libpthread.patch
@@ -0,0 +1,16 @@
+Link libgd against libpthread.
+When gnuplot is linked, pass the -lpthread argument.
+
+Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+---
+diff -Nurp gnuplot-4.6.2_orig/configure.in gnuplot-4.6.2/configure.in
+--- gnuplot-4.6.2_orig/configure.in	2014-07-22 18:53:14.226771000 +0530
++++ gnuplot-4.6.2/configure.in	2014-07-23 10:42:13.944386474 +0530
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
