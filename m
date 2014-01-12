From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:27 +0100
Subject: [Buildroot] [PATCH 13/14] sdl_image: add host version
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-14-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version is needed to build xbmc

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/sdl_image/sdl_image.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index ba9751d..05b9a1f 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -38,4 +38,15 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
+HOST_SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(HOST_DIR)/usr \
+                --with-sdl-exec-prefix=$(HOST_DIR)/usr \
+                --disable-sdltest \
+                --disable-static \
+                --disable-jpg-shared \
+                --disable-png-shared \
+                --disable-tif-shared \
+
+HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.5.2
