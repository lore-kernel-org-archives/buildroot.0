From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 17:33:03 +0100
Subject: [Buildroot] [git commit master] Revert "Revert "gvfs: update to
	version 1.4.0""
Message-ID: <20100128163328.196E67774D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57e0f540ffd2133e6540a0faea32663a2731e2ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 70ce96305cb19254576f670e896a66f3e3ba6eff.

Now that we have glib2 2.22.4, we can take the gvfs 1.4.0 update.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 ...-gnome.patch => gvfs-1.4.0-libsoup-gnome.patch} |   20 +++++++++++---------
 package/gvfs/gvfs.mk                               |    7 +++----
 3 files changed, 15 insertions(+), 14 deletions(-)
 rename package/gvfs/{gvfs-1.2.2-libsoup-gnome.patch => gvfs-1.4.0-libsoup-gnome.patch} (88%)

diff --git a/CHANGES b/CHANGES
index fcf5890..578543b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 
 	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
-	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
+	gst-plugins-bad, gvfs, flex, hal, iptables, iw, jpeg, kismet, libfuse,
 	libglib2, libpcap, libungif, libxml2, lighttpd, mesa, mpg123,
 	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, rpm, sawman, sdl,
 	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
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
index cf28862..64e6df4 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,18 +3,17 @@
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
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_LIBTOOL_PATCH = NO
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.6.3.3
