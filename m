From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Nov 2018 21:57:04 +0100
Subject: [Buildroot] [git commit branch/next] sdl2: bump to version 2.0.9
Message-ID: <20181117205831.E78C9837D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84f69b5d1d5b44583e20dc026493281ae81723e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...irectFB-renderer-not-being-enabled-in-aut.patch | 42 ----------------------
 package/sdl2/sdl2.hash                             |  4 +--
 package/sdl2/sdl2.mk                               |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch b/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch
deleted file mode 100644
index 53926c03b5..0000000000
--- a/package/sdl2/0001-Fixed-the-DirectFB-renderer-not-being-enabled-in-aut.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a0acea5bcce3f47badbfeeab7bc2e36eba08fd84 Mon Sep 17 00:00:00 2001
-From: Sam Lantinga <slouken@libsdl.org>
-Date: Mon, 27 Aug 2018 11:51:05 -0700
-Subject: [PATCH] Fixed the DirectFB renderer not being enabled in autoconf
- builds
-
-Upstream-url: https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure    | 3 +++
- configure.in | 1 +
- 2 files changed, 4 insertions(+)
-
-diff --git a/configure b/configure
-index e88b38001..40ac14d21 100755
---- a/configure
-+++ b/configure
-@@ -21501,6 +21501,9 @@ fi
- 
- $as_echo "#define SDL_VIDEO_DRIVER_DIRECTFB 1" >>confdefs.h
- 
-+
-+$as_echo "#define SDL_VIDEO_RENDER_DIRECTFB 1" >>confdefs.h
-+
-             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
-             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
- 
-diff --git a/configure.in b/configure.in
-index 5bf5d717b..ce1d57ea1 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2163,6 +2163,7 @@ AC_HELP_STRING([--enable-directfb-shared], [dynamically load directfb support [[
-                               , enable_directfb_shared=yes)
- 
-             AC_DEFINE(SDL_VIDEO_DRIVER_DIRECTFB, 1, [ ])
-+            AC_DEFINE(SDL_VIDEO_RENDER_DIRECTFB, 1, [ ])
-             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
-             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
- 
--- 
-2.11.0
-
diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 997b4a5d4f..0668883f06 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.8.tar.gz.sig
-sha256 edc77c57308661d576e843344d8638e025a7818bff73f8fbfab09c3c5fd092ec  SDL2-2.0.8.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.9.tar.gz.sig
+sha256 255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1  SDL2-2.0.9.tar.gz
 # Locally calculated
 sha256 61e627031e1160bf8b9bdbc9cda27656d422ea8eaab199b64b4a4a4168437154  COPYING.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index bd71485f18..d2fba9d810 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.8
+SDL2_VERSION = 2.0.9
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
