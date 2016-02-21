From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:27:59 +0100
Subject: [Buildroot] [git commit] package/sdl_sound: add --enable/disable-ogg
Message-ID: <20160221172809.0B82781801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08765471c7579ba4c74be3a475121b7a11d9345e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/sdl_sound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 6201967..861c932 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -32,7 +32,10 @@ SDL_SOUND_CONF_OPTS += --disable-modplug
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+SDL_SOUND_CONF_OPTS += --enable-ogg
 SDL_SOUND_DEPENDENCIES += libvorbis
+else
+SDL_SOUND_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
