From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Jul 2010 08:57:09 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_sound: add optional
	dependencies
Message-ID: <20100704065727.4857582575@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ba54aa10bb8936f3575e3b97916d299783cf858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the optional dependencies we have in BR (flac/speex/vorbis).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_sound/sdl_sound.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 5058551..3a6b7e7 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -15,6 +15,19 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
 endif
 
+# optional dependencies
+ifeq ($(BR2_PACKAGE_FLAC),y)
+SDL_SOUND_DEPENDENCIES += flac # is only used if ogg is also enabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+SDL_SOUND_DEPENDENCIES += libvorbis
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+SDL_SOUND_DEPENDENCIES += speex
+endif
+
 SDL_SOUND_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
-- 
1.7.1
