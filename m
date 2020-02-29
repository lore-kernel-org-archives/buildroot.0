From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 12:59:19 -0800
Subject: [Buildroot] [PATCH/next 1/1] package/libglib2: bump to version
 2.62.5
Message-ID: <20200229205919.2431885-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

             br-arm-full [1/6]: OK
  br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: SKIPPED
          br-x86-64-musl [4/6]: OK
      br-arm-full-static [5/6]: OK
            sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../libglib2/0002-allow-explicit-disabling-of-tests.patch   | 2 +-
 package/libglib2/0003-remove-cpp-requirement.patch          | 6 +++---
 ...04-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
 package/libglib2/libglib2.hash                              | 4 ++--
 package/libglib2/libglib2.mk                                | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch b/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
index d6c62499c3..c865c04e03 100644
--- a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
+++ b/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
@@ -23,7 +23,7 @@ diff --git a/meson.build b/meson.build
 index 99806d0..3206603 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -77,7 +77,7 @@ installed_tests_template = files('template.test.in')
+@@ -84,7 +84,7 @@ installed_tests_template = files('template.test.in')
  installed_tests_template_tap = files('template-tap.test.in')
  
  # Don?t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index d28f8ab81c..f13fe51061 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.62.4',
+   version : '2.62.5',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1484,20 +1483,6 @@ if g_have_iso_c_varargs
+@@ -1491,20 +1492,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2095,7 +2080,6 @@ subdir('gobject')
+@@ -2102,7 +2087,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index b76dd76f2f..5071084857 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -366,6 +366,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -373,6 +373,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e3478f06bb..0a60b75f82 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.62/glib-2.62.4.sha256sum
-sha256  4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc  glib-2.62.4.tar.xz
+# https://download.gnome.org/sources/glib/2.62/glib-2.62.5.sha256sum
+sha256  b8d1cdafa46658b63d7512efbe2cd21bd36cd7be83140e44930c47b79f82452e  glib-2.62.5.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f00818f69c..d2e064ccce 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.62
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.24.1
