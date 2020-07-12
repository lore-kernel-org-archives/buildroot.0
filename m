From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 22:57:37 +0200
Subject: [Buildroot] [git commit] package/sdl_image: fix WebP dynamically
 loaded on host build
Message-ID: <20200712210203.B4EB686A7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ab94102396cd99af51fdc0670e5ae129a0e79d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like with libjpeg and libpng, we don't want libwebp to be
dynamically loaded by SDL_image at runtime.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
