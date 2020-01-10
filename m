From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Jan 2020 23:02:37 +0100
Subject: [Buildroot] [PATCH 3/5] package/sdl2_mixer: fix fluidsynth option
In-Reply-To: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
References: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110220239.196975-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Option to disable fluidsynth is --disable-music-midi-fluidsynth since
version 2.0.0 and
https://github.com/SDL-mirror/SDL_mixer/commit/9fe78ec49f083e4f85e10abb9f1cbe7d6187d6b0

Before this commit, the configure option was
--disable-music-fluidsynth-midi (and not --disable-fluidsynth)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_mixer/sdl2_mixer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index c990847974..198333854e 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -13,7 +13,7 @@ SDL2_MIXER_INSTALL_STAGING = YES
 SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
 
 SDL2_MIXER_CONF_OPTS = \
-	--disable-fluidsynth \
+	--disable-music-midi-fluidsynth \
 	--disable-music-mp3
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
-- 
2.24.1
