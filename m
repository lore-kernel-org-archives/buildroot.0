From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Nov 2009 19:53:38 +0100
Subject: [Buildroot] [git commit master] Revert "gvfs: update to version
	1.4.0"
Message-ID: <20091124190731.322B07625B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=70ce96305cb19254576f670e896a66f3e3ba6eff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f49ef854ca4b6ab3836ef39cb89027ce5b7bd94b.

The new gvfs version needs libglib2 >= 2.21.2, but newer libglib2 versions
need ipv6 support and possibly cause other problems, so simply revert the
gvfs bump for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-gnome.patch => gvfs-1.2.2-libsoup-gnome.patch} |   20 +++++++++-----------
 package/gvfs/gvfs.mk                               |    8 ++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
 rename package/gvfs/{gvfs-1.4.0-libsoup-gnome.patch => gvfs-1.2.2-libsoup-gnome.patch} (88%)

diff --git a/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch b/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
similarity index 88%
rename from package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
rename to package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
index 1fc7944..cb59221 100644
--- a/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
+++ b/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
@@ -1,7 +1,6 @@
-diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
---- gvfs-1.4.0-orig/configure	2009-09-21 16:33:27.000000000 +0200
-+++ gvfs-1.4.0/configure	2009-10-18 13:28:02.000000000 +0200
-@@ -17056,8 +17056,8 @@
+--- gvfs-1.2.2-orig/configure	2009-04-13 19:30:57.000000000 +0200
++++ gvfs-1.2.2/configure	2009-05-25 11:49:31.000000000 +0200
+@@ -25645,8 +25645,8 @@
  
  if test "x$enable_http" != "xno"; then
    if test -n "$PKG_CONFIG" && \
@@ -12,7 +11,7 @@ diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
    ac_status=$?
    $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
    (exit $ac_status); }; then
-@@ -17074,12 +17074,12 @@
+@@ -25663,12 +25663,12 @@
      pkg_cv_HTTP_CFLAGS="$HTTP_CFLAGS"
   elif test -n "$PKG_CONFIG"; then
      if test -n "$PKG_CONFIG" && \
@@ -28,7 +27,7 @@ diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
  else
    pkg_failed=yes
  fi
-@@ -17090,12 +17090,12 @@
+@@ -25679,12 +25679,12 @@
      pkg_cv_HTTP_LIBS="$HTTP_LIBS"
   elif test -n "$PKG_CONFIG"; then
      if test -n "$PKG_CONFIG" && \
@@ -44,7 +43,7 @@ diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
  else
    pkg_failed=yes
  fi
-@@ -17113,14 +17113,14 @@
+@@ -25702,14 +25702,14 @@
          _pkg_short_errors_supported=no
  fi
          if test $_pkg_short_errors_supported = yes; then
@@ -62,7 +61,7 @@ diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
  
  $HTTP_PKG_ERRORS
  
-@@ -17131,7 +17131,7 @@
+@@ -25720,7 +25720,7 @@
  and HTTP_LIBS to avoid the need to call pkg-config.
  See the pkg-config man page for more details.
  " >&5
@@ -71,9 +70,8 @@ diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
  
  $HTTP_PKG_ERRORS
  
-diff -ur gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c gvfs-1.4.0/daemon/gvfsbackendhttp.c
---- gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c	2009-04-20 12:41:37.000000000 +0200
-+++ gvfs-1.4.0/daemon/gvfsbackendhttp.c	2009-10-18 13:28:02.000000000 +0200
+--- gvfs-1.2.2-orig/daemon/gvfsbackendhttp.c	2009-03-06 16:43:19.000000000 +0100
++++ gvfs-1.2.2/daemon/gvfsbackendhttp.c	2009-05-25 11:48:20.000000000 +0200
 @@ -33,7 +33,7 @@
  #include <glib/gi18n.h>
  #include <gio/gio.h>
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 7d71f34..fc4716c 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,17 +3,17 @@
 # gvfs
 #
 #############################################################
-GVFS_VERSION_MAJOR = 1.4
-GVFS_VERSION_MINOR = 0
+GVFS_VERSION_MAJOR = 1.2
+GVFS_VERSION_MINOR = 2
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
+
 GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
 GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-GVFS_AUTORECONF = NO
-GVFS_LIBTOOL_PATCH = NO
 
+GVFS_AUTORECONF = NO
 GVFS_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
 
 GVFS_CONF_OPT = \
-- 
1.6.3.3
