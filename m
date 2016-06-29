From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:24 +0200
Subject: [Buildroot] [PATCH 17/24] sdl_image: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-18-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sdl_image/sdl_image.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index b46fc6440f75..2b5dbc4d5052 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -36,16 +36,4 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
-HOST_SDL_IMAGE_CONF_OPTS = \
-	--with-sdl-prefix=$(HOST_DIR)/usr \
-	--with-sdl-exec-prefix=$(HOST_DIR)/usr \
-	--disable-sdltest \
-	--disable-static \
-	--disable-jpg-shared \
-	--disable-png-shared \
-	--disable-tif-shared \
-
-HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
