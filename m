From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Oct 2009 22:42:44 +0200
Subject: [Buildroot] [git commit master] gvfs: update to version 1.4.0
Message-ID: <20091020204319.DED0C7779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f49ef854ca4b6ab3836ef39cb89027ce5b7bd94b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the gvfs package to the latest upstream release.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-gnome.patch => gvfs-1.4.0-libsoup-gnome.patch} |   20 +++++++++++---------
 package/gvfs/gvfs.mk                               |    8 ++++----
 2 files changed, 15 insertions(+), 13 deletions(-)
 rename package/gvfs/{gvfs-1.2.2-libsoup-gnome.patch => gvfs-1.4.0-libsoup-gnome.patch} (88%)

diff --git a/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch b/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
similarity index 88%
rename from package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
rename to package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
index cb59221..1fc7944 100644
--- a/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
+++ b/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
@@ -1,6 +1,7 @@
---- gvfs-1.2.2-orig/configure	2009-04-13 19:30:57.000000000 +0200
-+++ gvfs-1.2.2/configure	2009-05-25 11:49:31.000000000 +0200
-@@ -25645,8 +25645,8 @@
+diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
+--- gvfs-1.4.0-orig/configure	2009-09-21 16:33:27.000000000 +0200
++++ gvfs-1.4.0/configure	2009-10-18 13:28:02.000000000 +0200
+@@ -17056,8 +17056,8 @@
  
  if test "x$enable_http" != "xno"; then
    if test -n "$PKG_CONFIG" && \
@@ -11,7 +12,7 @@
    ac_status=$?
    $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
    (exit $ac_status); }; then
-@@ -25663,12 +25663,12 @@
+@@ -17074,12 +17074,12 @@
      pkg_cv_HTTP_CFLAGS="$HTTP_CFLAGS"
   elif test -n "$PKG_CONFIG"; then
      if test -n "$PKG_CONFIG" && \
@@ -27,7 +28,7 @@
  else
    pkg_failed=yes
  fi
-@@ -25679,12 +25679,12 @@
+@@ -17090,12 +17090,12 @@
      pkg_cv_HTTP_LIBS="$HTTP_LIBS"
   elif test -n "$PKG_CONFIG"; then
      if test -n "$PKG_CONFIG" && \
@@ -43,7 +44,7 @@
  else
    pkg_failed=yes
  fi
-@@ -25702,14 +25702,14 @@
+@@ -17113,14 +17113,14 @@
          _pkg_short_errors_supported=no
  fi
          if test $_pkg_short_errors_supported = yes; then
@@ -61,7 +62,7 @@
  
  $HTTP_PKG_ERRORS
  
-@@ -25720,7 +25720,7 @@
+@@ -17131,7 +17131,7 @@
  and HTTP_LIBS to avoid the need to call pkg-config.
  See the pkg-config man page for more details.
  " >&5
@@ -70,8 +71,9 @@
  
  $HTTP_PKG_ERRORS
  
---- gvfs-1.2.2-orig/daemon/gvfsbackendhttp.c	2009-03-06 16:43:19.000000000 +0100
-+++ gvfs-1.2.2/daemon/gvfsbackendhttp.c	2009-05-25 11:48:20.000000000 +0200
+diff -ur gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c gvfs-1.4.0/daemon/gvfsbackendhttp.c
+--- gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c	2009-04-20 12:41:37.000000000 +0200
++++ gvfs-1.4.0/daemon/gvfsbackendhttp.c	2009-10-18 13:28:02.000000000 +0200
 @@ -33,7 +33,7 @@
  #include <glib/gi18n.h>
  #include <gio/gio.h>
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 9a6562b..5c71fef 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,17 +3,17 @@
 # gvfs
 #
 #############################################################
-GVFS_VERSION_MAJOR = 1.2
-GVFS_VERSION_MINOR = 2
+GVFS_VERSION_MAJOR = 1.4
+GVFS_VERSION_MINOR = 0
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
-
 GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
 GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 GVFS_AUTORECONF = NO
+GVFS_LIBTOOL_PATCH = NO
+
 GVFS_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
 
 GVFS_CONF_OPT = \
-- 
1.6.3.3
