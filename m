From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Sep 2010 15:35:23 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_sound: cleanup uninstall
	handling
Message-ID: <20100916133818.BCD4F8B3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7895986de4ec8819dbb7da4b939d8daec6606a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SDL_SOUND_SUBDIR doesn't exist, so the staging uninstall handling is
equivalent to the default one.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_sound/sdl_sound.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 9234ab6..bd94a62 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -49,14 +49,10 @@ ifneq ($(BR2_PACKAGE_SDL_SOUND_PLAYSOUND),y)
 SDL_SOUND_POST_INSTALL_TARGET_HOOKS += SDL_SOUND_REMOVE_PLAYSOUND
 endif
 
-define SDL_SOUND_UNINSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
-endef
-
 # target shared libs doesn't get removed by make uninstall if the .la
 # files are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
 define SDL_SOUND_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
+	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
 endef
 
-- 
1.7.1
