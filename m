From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 13:08:59 +0100
Subject: [Buildroot] [git commit branch/next] libgtk2: bump stable version
Message-ID: <20111118121916.6D3D68F5D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adaebbcccde5c7dc69ce06fad4cc2c0ad457f32c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...atch => host-libgtk2-reduce-dependencies.patch} |   22 ++++++++++----------
 package/libgtk2/libgtk2.mk                         |    4 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch b/package/libgtk2/host-libgtk2-reduce-dependencies.patch
similarity index 94%
rename from package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch
rename to package/libgtk2/host-libgtk2-reduce-dependencies.patch
index 49acf75..091eeb0 100644
--- a/package/libgtk2/host-libgtk2-2.20.1-reduce-dependencies.patch
+++ b/package/libgtk2/host-libgtk2-reduce-dependencies.patch
@@ -8,11 +8,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |  101 ++---------------------------------------------------------
  1 file changed, 4 insertions(+), 97 deletions(-)
 
-Index: gtk+-2.22.0/configure.in
+Index: gtk+-2.24.8/configure.in
 ===================================================================
---- gtk+-2.22.0.orig/configure.in
-+++ gtk+-2.22.0/configure.in
-@@ -258,12 +258,12 @@
+--- gtk+-2.24.8.orig/configure.in
++++ gtk+-2.24.8/configure.in
+@@ -259,12 +259,12 @@
    gdktarget=x11
  fi
  
@@ -27,7 +27,7 @@ Index: gtk+-2.22.0/configure.in
    *) AC_MSG_ERROR([Invalid target for GDK: use x11, quartz, directfb or win32.]);;
  esac
  
-@@ -373,9 +373,6 @@
+@@ -374,9 +374,6 @@
  ## annoying to construct
  PKG_CHECK_MODULES(BASE_DEPENDENCIES,
    [glib-2.0 >= glib_required_version dnl
@@ -37,7 +37,7 @@ Index: gtk+-2.22.0/configure.in
     gdk-pixbuf-2.0 >= gdk_pixbuf_required_version])
  
  ## In addition to checking that cairo is present, we also need to
-@@ -388,8 +385,6 @@
+@@ -389,8 +386,6 @@
  if test "x$cairo_backend" = "xx11"; then
     cairo_backend=xlib
  fi
@@ -46,7 +46,7 @@ Index: gtk+-2.22.0/configure.in
  
  if test "$os_win32" != yes; then
      # libtool option to control which symbols are exported
-@@ -1270,50 +1265,6 @@
+@@ -1280,50 +1275,6 @@
  fi
  
  
@@ -94,10 +94,10 @@ Index: gtk+-2.22.0/configure.in
 -  GDK_PACKAGES="$PANGO_PACKAGES gio-2.0 gdk-pixbuf-2.0 cairo-$cairo_backend"
 -fi
 -
- GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES`"
+ GDK_DEP_LIBS="$GDK_EXTRA_LIBS `$PKG_CONFIG --libs $GDK_PACKAGES` $MATH_LIB"
  GDK_DEP_CFLAGS="`$PKG_CONFIG --cflags  gthread-2.0 $GDK_PACKAGES` $GDK_EXTRA_CFLAGS"
  #
-@@ -1321,7 +1272,7 @@
+@@ -1331,7 +1282,7 @@
  # into the pkg-config files
  #
  if test $enable_explicit_deps != yes ; then
@@ -106,7 +106,7 @@ Index: gtk+-2.22.0/configure.in
    GDK_EXTRA_LIBS=
  fi
  
-@@ -1331,37 +1282,7 @@
+@@ -1341,37 +1292,7 @@
  AC_SUBST(GDK_DEP_LIBS)
  AC_SUBST(GDK_DEP_CFLAGS)
  
@@ -145,7 +145,7 @@ Index: gtk+-2.22.0/configure.in
  if test "x$gdktarget" = "xx11"; then
    GTK_PACKAGES="$GTK_PACKAGES pangoft2"
  fi
-@@ -1517,20 +1438,6 @@
+@@ -1527,20 +1448,6 @@
  gtk_save_cppflags="$CPPFLAGS"
  CPPFLAGS="$CPPFLAGS $GTK_DEP_CFLAGS $GDK_DEP_CFLAGS"
  
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 9a8c2bb..52edf47 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -3,8 +3,8 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION_MAJOR:=2.24
-LIBGTK2_VERSION_MINOR:=4
+LIBGTK2_VERSION_MAJOR = 2.24
+LIBGTK2_VERSION_MINOR = 8
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
