From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 16:13:15 +0100
Subject: [Buildroot] [git commit] sdl_image: add host version
Message-ID: <20140228133415.2CBE29BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e72b7a4e8c4b0bf1b5b268601de7990b54ee9a67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host version is needed to build xbmc

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_image/sdl_image.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

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
