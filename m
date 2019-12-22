From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 22:23:51 +0100
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.62.4
Message-ID: <20191222211509.5F9228D9B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e464f48887a99b2ea2ffef0bf167d42559f6735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglib2/0003-remove-cpp-requirement.patch                  | 6 +++---
 .../0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch      | 2 +-
 package/libglib2/libglib2.hash                                      | 4 ++--
 package/libglib2/libglib2.mk                                        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 80c6c80236..d28f8ab81c 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.62.3',
+   version : '2.62.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1490,20 +1489,6 @@ if g_have_iso_c_varargs
+@@ -1484,20 +1483,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2101,7 +2086,6 @@ subdir('gobject')
+@@ -2095,7 +2080,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index f792ceba3f..b76dd76f2f 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -372,6 +372,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -366,6 +366,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e2293d6ca8..e3478f06bb 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.62/glib-2.62.3.sha256sum
-sha256  4400adc9f0d3ffcfe8e84225210370ce3f9853afb81812ddadb685325aa655c4  glib-2.62.3.tar.xz
+# https://download.gnome.org/sources/glib/2.62/glib-2.62.4.sha256sum
+sha256  4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc  glib-2.62.4.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 9aaace2963..f00818f69c 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.62
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
