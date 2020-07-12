From: Paul Cercueil <paul@crapouillou.net>
Date: Sun, 12 Jul 2020 21:57:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/sdl_image: fix WebP dynamically
 loaded on host build
Message-ID: <20200712195712.332139-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like with libjpeg and libpng, we don't want libwebp to be
dynamically loaded by SDL_image at runtime.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/sdl_image/sdl_image.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index ee0712cc27..46a28799cf 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -43,7 +43,8 @@ HOST_SDL_IMAGE_CONF_OPTS = \
 	--disable-static \
 	--disable-jpg-shared \
 	--disable-png-shared \
-	--disable-tif-shared
+	--disable-tif-shared \
+	--disable-webp-shared
 
 HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
 
-- 
2.27.0
