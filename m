From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:05:35 +0200
Subject: [Buildroot] [git commit] package/sdl_image: disable dynamic loading
 of libraries
Message-ID: <20200712210203.BD42D86A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b69830b74d680c71638ddc1de7f1cd34532cb76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The thing with Buildroot, is that we know in advance what will be in the
root filesystem. Therefore, we don't need SDL_image to probe for the
presence of libpng, libjpeg, libtiff or libwebp and dynamically load
them; SDL_image can be linked to them directly at compilation time.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_image/sdl_image.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 46a28799cf..95a03a3956 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -16,6 +16,10 @@ SDL_IMAGE_CONF_OPTS = \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
 	--disable-static \
+	--disable-jpg-shared \
+	--disable-png-shared \
+	--disable-tif-shared \
+	--disable-webp-shared \
 	--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
 	--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
 	--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
