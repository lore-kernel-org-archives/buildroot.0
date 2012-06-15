From: Anton Leontiev <aleontiev@elvees.com>
Date: Fri, 15 Jun 2012 16:44:54 +0400
Subject: [Buildroot] [PATCH] ffmpeg: bump to 0.11.1
Message-ID: <4FDB2E46.8090705@elvees.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Leontiev <aleontiev@elvees.com>

---
  package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch |  16 ++++++++--------
  package/multimedia/ffmpeg/ffmpeg.mk              |   2 +-
  2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch 
b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
--- a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
+++ b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
@@ -2,16 +2,16 @@
  So just pass the whole string to make things simpler.

  Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Anton Leontiev <aleontiev@elvees.com>

-diff -Nura ffmpeg-0.8.7.orig/configure ffmpeg-0.8.7/configure
---- ffmpeg-0.8.7.orig/configure    2011-11-21 16:49:30.000000000 -0300
-+++ ffmpeg-0.8.7/configure    2011-12-02 08:13:36.746619395 -0300
-@@ -2957,7 +2957,7 @@
- enabled libxvid    && require  libxvid xvid.h xvid_global -lxvidcore
- enabled mlib       && require  mediaLib mlib_types.h 
mlib_VectorSub_S16_U8_Mod -lmlib
+--- ffmpeg-0.11.1/configure    2012-06-08 01:01:19.000000000 +0400
++++ ffmpeg-0.11.1.patched/configure    2012-06-09 13:35:36.378143678 +0400
+@@ -3266,7 +3266,7 @@
+     die "ERROR: No version of libdc1394 found "
+ fi

  -SDL_CONFIG="${cross_prefix}sdl-config"
-+SDL_CONFIG="${SDL_CONFIG}"
- if check_pkg_config sdl SDL_version.h SDL_Linked_Version; then
++# SDL_CONFIG is passed through environment by Buildroot
+ if check_pkg_config sdl SDL_events.h SDL_PollEvent; then
       check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | 
SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
       enable sdl &&
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk 
b/package/multimedia/ffmpeg/ffmpeg.mk
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
  #
  #############################################################

-FFMPEG_VERSION = 0.8.11
+FFMPEG_VERSION = 0.11.1
  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
  FFMPEG_SITE = http://ffmpeg.org/releases
  FFMPEG_INSTALL_STAGING = YES
--

-- 
Anton Leontiev <aleontiev@elvees.com>
