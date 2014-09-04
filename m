From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 23:07:04 +0200
Subject: [Buildroot] [git commit] Revert "SDL_image: fix runtime libjpeg
	failure"
Message-ID: <20140905110202.68B859D608@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1941a9ee0a1b1e8cb55d1ccf0ddb79a75ebdfd49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 883f066797ae0e7a017fac8e275f6e58659db760.

Bug in configure script was fixed upstream in SDL_image 1.2.8.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_image/sdl_image.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

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
