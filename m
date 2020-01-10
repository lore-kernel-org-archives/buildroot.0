From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Jan 2020 23:02:38 +0100
Subject: [Buildroot] [PATCH 4/5] package/sdl2_mixer: add optional fluidsynth
 dependency
In-Reply-To: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
References: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110220239.196975-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_mixer/sdl2_mixer.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index 198333854e..34bba5772d 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -12,9 +12,7 @@ SDL2_MIXER_LICENSE_FILES = COPYING.txt
 SDL2_MIXER_INSTALL_STAGING = YES
 SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
 
-SDL2_MIXER_CONF_OPTS = \
-	--disable-music-midi-fluidsynth \
-	--disable-music-mp3
+SDL2_MIXER_CONF_OPTS = --disable-music-mp3
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 SDL2_MIXER_CONF_OPTS += --enable-music-flac
@@ -23,6 +21,13 @@ else
 SDL2_MIXER_CONF_OPTS += --disable-music-flac
 endif
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
+SDL2_MIXER_CONF_OPTS += --enable-music-midi-fluidsynth
+SDL2_MIXER_DEPENDENCIES += fluidsynth
+else
+SDL2_MIXER_CONF_OPTS += --disable-music-midi-fluidsynth
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
 SDL2_MIXER_CONF_OPTS += --enable-music-mod-modplug
 SDL2_MIXER_DEPENDENCIES += libmodplug
-- 
2.24.1
