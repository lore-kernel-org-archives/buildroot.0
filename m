From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 25 Jan 2010 19:00:38 +0100
Subject: [Buildroot] [PATCH] SDL_ttf needs freetype to be built and
	installed first.
Message-ID: <1264442438-14868-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/sdl_ttf/sdl_ttf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 29e40e8..21bfc5e 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -60,7 +60,7 @@ $(TARGET_DIR)/usr/lib/libSDL_ttf.so: $(STAGING_DIR)/usr/lib/libSDL_ttf.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
-sdl_ttf: sdl $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+sdl_ttf: sdl freetype $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
 sdl_ttf-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_TTF_DIR) uninstall
-- 
1.6.0.4
