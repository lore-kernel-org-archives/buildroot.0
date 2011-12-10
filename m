From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:20:56 +0100
Subject: [Buildroot] [git commit] ffmpeg: bump to version 0.8.7
Message-ID: <20111210222041.0B7D28F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f113cc334059093a5a4aa8d04908f161835f7386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch |   18 +++++++++---------
 package/multimedia/ffmpeg/ffmpeg.mk              |    2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
index de2c004..64371b2 100644
--- a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
+++ b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
@@ -3,15 +3,15 @@ So just pass the whole string to make things simpler.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura ffmpeg-0.6.1/configure ffmpeg-0.6.1.sdl/configure
---- ffmpeg-0.6.1/configure	2010-06-15 16:44:30.000000000 -0300
-+++ ffmpeg-0.6.1.sdl/configure	2011-02-25 17:13:12.979168176 -0300
-@@ -2640,7 +2640,7 @@
-     die "ERROR: No version of libdc1394 found "
- fi
+diff -Nura ffmpeg-0.8.7.orig/configure ffmpeg-0.8.7/configure
+--- ffmpeg-0.8.7.orig/configure	2011-11-21 16:49:30.000000000 -0300
++++ ffmpeg-0.8.7/configure	2011-12-02 08:13:36.746619395 -0300
+@@ -2957,7 +2957,7 @@
+ enabled libxvid    && require  libxvid xvid.h xvid_global -lxvidcore
+ enabled mlib       && require  mediaLib mlib_types.h mlib_VectorSub_S16_U8_Mod -lmlib
  
 -SDL_CONFIG="${cross_prefix}sdl-config"
 +SDL_CONFIG="${SDL_CONFIG}"
- if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
-     sdl_cflags=$("${SDL_CONFIG}" --cflags)
-     sdl_libs=$("${SDL_CONFIG}" --libs)
+ if check_pkg_config sdl SDL_version.h SDL_Linked_Version; then
+     check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
+     enable sdl &&
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index ca41892..ef97674 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FFMPEG_VERSION = 0.6.3
+FFMPEG_VERSION = 0.8.7
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
