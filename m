From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:27:48 +0100
Subject: [Buildroot] [git commit] package/sdl_mixer: add host-pkgconf
 dependency
Message-ID: <20191231081827.69AF0814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b3efb406089bfbfe9645b26a86c93a92416e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is needed to find libmodplug

Fixes:
 - http://autobuild.buildroot.org/results/83f378d9d01424678006434bb1e4a49cf4131fdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
