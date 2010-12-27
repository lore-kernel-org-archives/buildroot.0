From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 23:50:25 +0100
Subject: [Buildroot] [git commit master 1/1] gvfs: bump version to fix build
	with recent glib
Message-ID: <20101227225120.6CE218EB86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cc5d00215ae5c2fb04869ea8d44d4f1694fafcb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglib2 recently got a gdbusutils.h file as well, confusing the gvfs
build. Update to a more recent version containing a workaround.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs-1.4.0-libsoup-gnome.patch |  106 ---------------------------
 package/gvfs/gvfs.mk                        |    4 +-
 2 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 package/gvfs/gvfs-1.4.0-libsoup-gnome.patch

diff --git a/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch b/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
deleted file mode 100644
index 1fc7944..0000000
--- a/package/gvfs/gvfs-1.4.0-libsoup-gnome.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-diff -ur gvfs-1.4.0-orig/configure gvfs-1.4.0/configure
---- gvfs-1.4.0-orig/configure	2009-09-21 16:33:27.000000000 +0200
-+++ gvfs-1.4.0/configure	2009-10-18 13:28:02.000000000 +0200
-@@ -17056,8 +17056,8 @@
- 
- if test "x$enable_http" != "xno"; then
-   if test -n "$PKG_CONFIG" && \
--    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 >= 2.25.1\"") >&5
--  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 >= 2.25.1") 2>&5
-+    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 >= 2.25.1\"") >&5
-+  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 >= 2.25.1") 2>&5
-   ac_status=$?
-   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
-   (exit $ac_status); }; then
-@@ -17074,12 +17074,12 @@
-     pkg_cv_HTTP_CFLAGS="$HTTP_CFLAGS"
-  elif test -n "$PKG_CONFIG"; then
-     if test -n "$PKG_CONFIG" && \
--    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 libxml-2.0\"") >&5
--  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 libxml-2.0") 2>&5
-+    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 libxml-2.0\"") >&5
-+  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 libxml-2.0") 2>&5
-   ac_status=$?
-   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
-   (exit $ac_status); }; then
--  pkg_cv_HTTP_CFLAGS=`$PKG_CONFIG --cflags "libsoup-gnome-2.4 libxml-2.0" 2>/dev/null`
-+  pkg_cv_HTTP_CFLAGS=`$PKG_CONFIG --cflags "libsoup-2.4 libxml-2.0" 2>/dev/null`
- else
-   pkg_failed=yes
- fi
-@@ -17090,12 +17090,12 @@
-     pkg_cv_HTTP_LIBS="$HTTP_LIBS"
-  elif test -n "$PKG_CONFIG"; then
-     if test -n "$PKG_CONFIG" && \
--    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 libxml-2.0\"") >&5
--  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 libxml-2.0") 2>&5
-+    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 libxml-2.0\"") >&5
-+  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 libxml-2.0") 2>&5
-   ac_status=$?
-   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
-   (exit $ac_status); }; then
--  pkg_cv_HTTP_LIBS=`$PKG_CONFIG --libs "libsoup-gnome-2.4 libxml-2.0" 2>/dev/null`
-+  pkg_cv_HTTP_LIBS=`$PKG_CONFIG --libs "libsoup-2.4 libxml-2.0" 2>/dev/null`
- else
-   pkg_failed=yes
- fi
-@@ -17113,14 +17113,14 @@
-         _pkg_short_errors_supported=no
- fi
-         if test $_pkg_short_errors_supported = yes; then
--	        HTTP_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors "libsoup-gnome-2.4 libxml-2.0" 2>&1`
-+	        HTTP_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors "libsoup-2.4 libxml-2.0" 2>&1`
-         else
--	        HTTP_PKG_ERRORS=`$PKG_CONFIG --print-errors "libsoup-gnome-2.4 libxml-2.0" 2>&1`
-+	        HTTP_PKG_ERRORS=`$PKG_CONFIG --print-errors "libsoup-2.4 libxml-2.0" 2>&1`
-         fi
- 	# Put the nasty error message in config.log where it belongs
- 	echo "$HTTP_PKG_ERRORS" >&5
- 
--	{ { $as_echo "$as_me:$LINENO: error: Package requirements (libsoup-gnome-2.4 libxml-2.0) were not met:
-+	{ { $as_echo "$as_me:$LINENO: error: Package requirements (libsoup-2.4 libxml-2.0) were not met:
- 
- $HTTP_PKG_ERRORS
- 
-@@ -17131,7 +17131,7 @@
- and HTTP_LIBS to avoid the need to call pkg-config.
- See the pkg-config man page for more details.
- " >&5
--$as_echo "$as_me: error: Package requirements (libsoup-gnome-2.4 libxml-2.0) were not met:
-+$as_echo "$as_me: error: Package requirements (libsoup-2.4 libxml-2.0) were not met:
- 
- $HTTP_PKG_ERRORS
- 
-diff -ur gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c gvfs-1.4.0/daemon/gvfsbackendhttp.c
---- gvfs-1.4.0-orig/daemon/gvfsbackendhttp.c	2009-04-20 12:41:37.000000000 +0200
-+++ gvfs-1.4.0/daemon/gvfsbackendhttp.c	2009-10-18 13:28:02.000000000 +0200
-@@ -33,7 +33,7 @@
- #include <glib/gi18n.h>
- #include <gio/gio.h>
- 
--#include <libsoup/soup-gnome.h>
-+#include <libsoup/soup.h>
- #include "gvfsbackendhttp.h"
- #include "gvfsjobopenforread.h"
- #include "gvfsjobread.h"
-@@ -80,7 +80,6 @@
- g_vfs_backend_http_init (GVfsBackendHttp *backend)
- {
-   const char         *debug;
--  SoupSessionFeature *proxy_resolver;
- 
-   g_vfs_backend_set_user_visible (G_VFS_BACKEND (backend), FALSE);  
- 
-@@ -92,12 +91,6 @@
-                                                                 "gvfs/" VERSION,
-                                                                 NULL);
- 
--  /* Proxy handling */
--  proxy_resolver = g_object_new (SOUP_TYPE_PROXY_RESOLVER_GNOME, NULL);
--  soup_session_add_feature (backend->session, proxy_resolver);
--  soup_session_add_feature (backend->session_async, proxy_resolver);
--  g_object_unref (proxy_resolver);
--
-   /* Logging */
-   debug = g_getenv ("GVFS_HTTP_DEBUG");
-   if (debug)
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d71a2a8..42c27fc 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -3,8 +3,8 @@
 # gvfs
 #
 #############################################################
-GVFS_VERSION_MAJOR = 1.4
-GVFS_VERSION_MINOR = 0
+GVFS_VERSION_MAJOR = 1.6
+GVFS_VERSION_MINOR = 6
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
-- 
1.7.2.2
