From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jun 2013 13:13:02 +0200
Subject: [Buildroot] [git commit] sdl_image: bump to version 1.2.12
Message-ID: <20130614115833.3A8B89AD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42aba9658d7bff3e60900b42b14ad6b8122fad0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added:
- WEBP file format support
- License information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_image/Config.in    |    4 ++++
 package/sdl_image/sdl_image.mk |    8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 36aa4a8..be0321a 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -42,6 +42,10 @@ config BR2_PACKAGE_SDL_IMAGE_TIFF
 	bool "enable TIFF file format support"
 	select BR2_PACKAGE_TIFF
 
+config BR2_PACKAGE_SDL_IMAGE_WEBP
+	bool "enable WEBP file format support"
+	select BR2_PACKAGE_WEBP
+
 config BR2_PACKAGE_SDL_IMAGE_XCF
 	bool "enable XCF file format support"
 
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index de72a04..3945505 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-SDL_IMAGE_VERSION = 1.2.6
+SDL_IMAGE_VERSION = 1.2.12
 SDL_IMAGE_SOURCE = SDL_image-$(SDL_IMAGE_VERSION).tar.gz
 SDL_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL_IMAGE_INSTALL_STAGING = YES
+SDL_IMAGE_LICENSE = zlib
+SDL_IMAGE_LICENSE_FILES = COPYING
 
 SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
@@ -25,6 +27,7 @@ SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--enable-pnm=$(if $(BR2_PACKAGE_SDL_IMAGE_PNM),yes,no) \
 		--enable-tga=$(if $(BR2_PACKAGE_SDL_IMAGE_TARGA),yes,no) \
 		--enable-tif=$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),yes,no) \
+		--enable-webp=$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),yes,no) \
 		--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
 		--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
 		--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
@@ -32,6 +35,7 @@ SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),jpeg) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
-	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
+	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
+	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
 $(eval $(autotools-package))
