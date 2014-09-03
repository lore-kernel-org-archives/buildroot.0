From: Maarten ter Huurne <maarten@treewalker.org>
Date: Wed,  3 Sep 2014 04:12:32 +0200
Subject: [Buildroot] [PATCH] Revert "SDL_image: fix runtime libjpeg failure"
Message-ID: <1409710352-6375-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 883f066797ae0e7a017fac8e275f6e58659db760.

Bug in configure script was fixed upstream in SDL_image 1.2.8.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 package/sdl_image/sdl_image.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 05b9a1f..c539526 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -15,9 +15,6 @@ SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
 		--disable-static \
-		--disable-jpg-shared \
-		--disable-png-shared \
-		--disable-tif-shared \
 		--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
 		--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
 		--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
-- 
1.8.4.5
