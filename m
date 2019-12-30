From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Dec 2019 22:09:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/sdl_mixer: add host-pkgconf
 dependency
Message-ID: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-pkgconf is needed to find libmodplug

Fixes:
 - http://autobuild.buildroot.org/results/83f378d9d01424678006434bb1e4a49cf4131fdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl_mixer/sdl_mixer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 0423817316..ab6f7ef014 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -37,7 +37,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
 SDL_MIXER_CONF_OPTS += --enable-music-mod-modplug
-SDL_MIXER_DEPENDENCIES += libmodplug
+SDL_MIXER_DEPENDENCIES += host-pkgconf libmodplug
 else
 SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
 endif
-- 
2.24.0
