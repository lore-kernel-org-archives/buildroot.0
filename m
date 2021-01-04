From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 23:09:31 +0100
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 2.7.4
Message-ID: <20210104215338.62DB68264D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb5f077a1347a9c612db77b478d2e0ab84149eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ... => 0001-meson.build-check-for-pthread.h.patch} |  2 +-
 ...uild-allow-introspection-when-cross-compi.patch | 33 ----------------------
 package/harfbuzz/harfbuzz.hash                     |  2 +-
 package/harfbuzz/harfbuzz.mk                       |  2 +-
 4 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/harfbuzz/0002-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
similarity index 97%
rename from package/harfbuzz/0002-meson.build-check-for-pthread.h.patch
rename to package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
index 128876dfb7..6d7225cbb0 100644
--- a/package/harfbuzz/0002-meson.build-check-for-pthread.h.patch
+++ b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
@@ -26,7 +26,7 @@ diff --git a/meson.build b/meson.build
 index bf3925db..6d263d48 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -284,13 +284,15 @@ endif
+@@ -281,13 +281,15 @@ endif
  # threads
  thread_dep = null_dep
  if host_machine.system() != 'windows'
diff --git a/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch b/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch
deleted file mode 100644
index 700f6f85e4..0000000000
--- a/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 432dfd0a1d8fe0a8df89e7ce828c520c7758f10c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 24 Sep 2020 21:00:34 +0200
-Subject: [PATCH] src/meson.build: allow introspection when cross-compiling
-
-introspection can be enabled when cross-compiling on certains conditions
-(for example it is supported by buildroot)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/harfbuzz/harfbuzz/pull/2692]
----
- src/meson.build | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 19290245..7db43508 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -637,11 +637,6 @@ if have_gobject
-   gir = find_program('g-ir-scanner', required: get_option('introspection'))
-   build_gir = gir.found()
- 
--  build_gir = build_gir and not meson.is_cross_build()
--  if not build_gir and get_option('introspection').enabled()
--    error('Introspection support is requested but it isn\'t available in cross builds')
--  endif
--
-   build_gir = build_gir and get_option('default_library') != 'static'
-   if not build_gir and get_option('introspection').enabled()
-     error('Introspection support is requested but the default library option should be shared or both')
--- 
-2.28.0
-
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index dac859bbd4..98b137c8bd 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8c048d7c2964a12f2c80deb6634dfc836b603dd12bf0d0a3df1627698e220ce  harfbuzz-2.7.2.tar.xz
+sha256  6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7  harfbuzz-2.7.4.tar.xz
 sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index fae9278b7c..a17283bea9 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.7.2
+HARFBUZZ_VERSION = 2.7.4
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
