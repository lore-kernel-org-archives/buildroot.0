From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  6 Mar 2020 14:14:58 -0700
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.64.0
Message-ID: <20200306211458.54107-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../libglib2/0003-remove-cpp-requirement.patch | 18 +++++++++---------
 package/libglib2/libglib2.hash                 |  4 ++--
 package/libglib2/libglib2.mk                   |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index d28f8ab81c..315b65f764 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -1,4 +1,4 @@
-From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
+From 5bad146ac17586f3f46d64ec927a11d25845810f Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
 Date: Mon, 16 Sep 2019 10:12:38 -0700
 Subject: [PATCH] remove cpp requirement
@@ -17,7 +17,7 @@ https://gitlab.gnome.org/GNOME/glib/issues/1748
  3 files changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
-index 7ef8c48..128e65d 100644
+index 7ef8c481d..128e65d96 100644
 --- a/glib/glibconfig.h.in
 +++ b/glib/glibconfig.h.in
 @@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
@@ -29,13 +29,13 @@ index 7ef8c48..128e65d 100644
  /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
   * is passed ISO vararg support is turned off, and there is no work
 diff --git a/meson.build b/meson.build
-index 4bbf4c2..ac59f4e 100644
+index 60f7ce887..d3d84726c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.62.4',
+   version : '2.64.0',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1484,20 +1483,6 @@ if g_have_iso_c_varargs
+@@ -1548,20 +1547,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2095,7 +2080,6 @@ subdir('gobject')
+@@ -2167,7 +2152,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
@@ -76,10 +76,10 @@ index 4bbf4c2..ac59f4e 100644
    subdir('tests')
  endif
 diff --git a/tests/meson.build b/tests/meson.build
-index e4ea226..7fd974c 100644
+index 6741f8f52..316cf2527 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -56,11 +56,6 @@ tests = {
+@@ -55,11 +55,6 @@ tests = {
      'source': 'module-test.c',
      'c_args': ['-DMODULE_TYPE="plugin"'],
    },
@@ -92,5 +92,5 @@ index e4ea226..7fd974c 100644
  
  test_extra_programs = {
 -- 
-2.23.0
+2.20.1
 
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e3478f06bb..b15e538afd 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.62/glib-2.62.4.sha256sum
-sha256  4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc  glib-2.62.4.tar.xz
+# https://download.gnome.org/sources/glib/2.64/glib-2.64.0.sha256sum
+sha256  e5e514e47d169cdb4111c3ea4af0300e1b1a5f428a474d2d7ddadf38dd061280  glib-2.64.0.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f00818f69c..a5e70193bf 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.62
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.64
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -80,10 +80,10 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
-LIBGLIB2_CONF_OPTS += -Dlibmount=true
+LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
 LIBGLIB2_DEPENDENCIES += util-linux
 else
-LIBGLIB2_CONF_OPTS += -Dlibmount=false
+LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
 
 # Purge useless binaries from target
-- 
2.20.1
