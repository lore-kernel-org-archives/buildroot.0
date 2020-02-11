From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2020 00:05:11 +0100
Subject: [Buildroot] [git commit] package/sdl2_mixer: bump to version 2.0.4
Message-ID: <20200211225643.CCEEC8DE55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62002ff64eb5dc4a20c653e3053b08e67b43b8a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also enabled support for Opus music playback using opusfile library

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_mixer/sdl2_mixer.hash | 4 ++--
 package/sdl2_mixer/sdl2_mixer.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index 441d0124e4..f3bab151f2 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f  SDL2_mixer-2.0.1.tar.gz
-sha256  4fc74d216e009c7cc5d939b688fc122b329787dcd24f69ae2a08ce052c826b39  COPYING.txt
+sha256  b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419  SDL2_mixer-2.0.4.tar.gz
+sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index 34bba5772d..f349b8ca80 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_MIXER_VERSION = 2.0.1
+SDL2_MIXER_VERSION = 2.0.4
 SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
 SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL2_MIXER_LICENSE = Zlib
@@ -35,6 +35,13 @@ else
 SDL2_MIXER_CONF_OPTS += --disable-music-mod-modplug
 endif
 
+ifeq ($(BR2_PACKAGE_OPUSFILE),y)
+SDL2_MIXER_CONF_OPTS += --enable-music-opus
+SDL2_MIXER_DEPENDENCIES += opusfile
+else
+SDL2_MIXER_CONF_OPTS += --disable-music-opus
+endif
+
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 SDL2_MIXER_CONF_OPTS += --enable-music-ogg-tremor
 SDL2_MIXER_DEPENDENCIES += tremor
