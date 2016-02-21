From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:28:05 +0100
Subject: [Buildroot] [git commit] package/sdl_sound: add
	--enable/disable-speex
Message-ID: <20160221172809.2053081801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ae2d8b0b84917df9000caeec12d648c46f7c40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 861c932..4fa7d9b 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -39,7 +39,10 @@ SDL_SOUND_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
+SDL_SOUND_CONF_OPTS += --enable-speex
 SDL_SOUND_DEPENDENCIES += speex
+else
+SDL_SOUND_CONF_OPTS += --disable-speex
 endif
 
 SDL_SOUND_CONF_OPTS = \
