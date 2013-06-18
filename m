From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 18 Jun 2013 12:40:05 +0100
Subject: [Buildroot] [PATCH] sconeserver: bump version
Message-ID: <1371555605-3757-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

A patch from Thomas Petazzoni has been upstreamed in sconeserver; bump version
and remove the patch from Buildroot.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../sconeserver-fix-configure-operators.patch      | 93 ----------------------
 package/sconeserver/sconeserver.mk                 |  2 +-
 2 files changed, 1 insertion(+), 94 deletions(-)
 delete mode 100644 package/sconeserver/sconeserver-fix-configure-operators.patch

diff --git a/package/sconeserver/sconeserver-fix-configure-operators.patch b/package/sconeserver/sconeserver-fix-configure-operators.patch
deleted file mode 100644
index 504be45..0000000
--- a/package/sconeserver/sconeserver-fix-configure-operators.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-configure: use the proper '=' POSIX shell operator
-
-The '==' shell operator doesn't work in POSIX shells, so when sh is
-symlinked to a POSIX shell such as dash and not a bash shell, the
-configure tests that use this operator fail to work.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: sconeserver-211/configure.in
-===================================================================
---- sconeserver-211.orig/configure.in	2013-05-14 12:00:19.000000000 +0200
-+++ sconeserver-211/configure.in	2013-06-16 18:47:31.000000000 +0200
-@@ -121,7 +121,7 @@
-   [SSL="$withval"],
-   [AC_CHECK_HEADER([openssl/ssl.h],[SSL="yes"],[SSL="no"])]
- )
--if test "x$SSL" == "xyes"; then
-+if test "x$SSL" = "xyes"; then
-   AC_CHECK_HEADER([openssl/ssl.h],,
-     [AC_MSG_ERROR([header file <openssl/ssl.h> is required for OpenSSL, use --with-openssl-path=PATH])]
-   )
-@@ -179,7 +179,7 @@
- )
- 
- # Check we have libxml2 if Sconesite is enabled
--if test "x$SCONESITE" == "xyes"; then
-+if test "x$SCONESITE" = "xyes"; then
-   if test "x$ac_cv_lib_xml2_xmlNewDoc" != "xyes"; then
-     AC_MSG_ERROR([library 'libxml2' is required for Sconesite])
-   fi
-@@ -195,7 +195,7 @@
-   [MAGICK_CONFIG="Magick++-config"]
- )
- AC_CHECK_PROG([MAGICK], ["$MAGICK_CONFIG"], [yes], [no])
--if test "x$MAGICK" == "xyes"; then
-+if test "x$MAGICK" = "xyes"; then
-   MAGICK_CFLAGS=`$MAGICK_CONFIG --cppflags`
-   MAGICK_LDFLAGS=`$MAGICK_CONFIG --ldflags`
-   MAGICK_LIBS=`$MAGICK_CONFIG --libs`
-@@ -209,7 +209,7 @@
- )
- 
- # Need ImageMagick for image
--if test "x$IMAGE" == "xyes"; then
-+if test "x$IMAGE" = "xyes"; then
-   if test "x$MAGICK" != "xyes"; then
-     AC_MSG_ERROR([library 'Magick++' is required for image])
-   fi
-@@ -227,7 +227,7 @@
-   [RSS="yes"]
- )
- # Need libxml2 library for rss
--if test "x$RSS" == "xyes"; then
-+if test "x$RSS" = "xyes"; then
-   if test "x$ac_cv_lib_xml2_xmlNewDoc" != "xyes"; then
-     AC_MSG_ERROR([library 'libxml2' is required for the rss module])
-   fi
-@@ -249,7 +249,7 @@
-   [AC_CHECK_HEADER([mysql/mysql.h],[MYSQL="yes"],[MYSQL="no"])]
- )
- # Need mysqlclient library for mysql
--if test "x$MYSQL" == "xyes"; then
-+if test "x$MYSQL" = "xyes"; then
-   AC_CHECK_LIB([mysqlclient],[mysql_init],
-     [CXXFLAGS="$CXXFLAGS `$MYSQL_CONFIG --cflags`"
-      MYSQL_LIBADD=`$MYSQL_CONFIG --libs`
-@@ -266,7 +266,7 @@
-   [AC_CHECK_HEADER([sqlite3.h],[SQLITE="yes"],[SQLITE="no"])]
- )
- # Need sqlite3 library for sqlite
--if test "x$SQLITE" == "xyes"; then
-+if test "x$SQLITE" = "xyes"; then
-   AC_CHECK_LIB([sqlite3],[sqlite3_open_v2],
-     [SQLITE_LIBADD="-lsqlite3"
-      AC_SUBST(SQLITE_LIBADD)],
-@@ -283,7 +283,7 @@
-   [AC_CHECK_HEADER([mpfr.h],[MATHS="yes"],[MATHS="no"])]
- )
- # Need libgmp and libmpfr library for maths
--if test "x$MATHS" == "xyes"; then
-+if test "x$MATHS" = "xyes"; then
-   AC_CHECK_LIB([mpfr],[mpfr_init],
-     [MATHS_LIBADD="-lgmp -lmpfr"
-      AC_SUBST(MATHS_LIBADD)],
-@@ -300,7 +300,7 @@
-   [AC_CHECK_HEADER([X11/Xlib.h],[UI="yes"],[UI="no"])]
- )
- # Need libX11 library for ui
--if test "x$UI" == "xyes"; then
-+if test "x$UI" = "xyes"; then
-   AC_CHECK_LIB([X11],[XOpenDisplay],
-     [UI_LIBADD="-lX11"
-      AC_SUBST(UI_LIBADD)],
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index ff6eada..62cc0ee 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -6,7 +6,7 @@
 
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Subversion trunk snapshot.
-SCONESERVER_VERSION = 211
+SCONESERVER_VERSION = 212
 SCONESERVER_SITE = svn://svn.code.sf.net/p/sconeserver/code/trunk
 SCONESERVER_SITE_METHOD = svn
 SCONESERVER_LICENSE = GPLv2+
-- 
1.8.1.2
