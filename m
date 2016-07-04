From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:31 +0200
Subject: [Buildroot] [PATCH 20/83 v2] package/sdl_image: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <4dd96f27f85bfc61b46043668e56b1e9c7f79a31.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sdl_image/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 1b98066..0c4a018 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SDL_IMAGE
+menuconfig BR2_PACKAGE_SDL_IMAGE
 	bool "SDL_image"
 	depends on BR2_PACKAGE_SDL
 	help
@@ -10,8 +10,6 @@ config BR2_PACKAGE_SDL_IMAGE
 
 if BR2_PACKAGE_SDL_IMAGE
 
-menu "SDL_image file format support"
-
 config BR2_PACKAGE_SDL_IMAGE_BMP
 	bool "enable BMP file format support"
 	default y
@@ -56,6 +54,4 @@ config BR2_PACKAGE_SDL_IMAGE_XPM
 config BR2_PACKAGE_SDL_IMAGE_XV
 	bool "enable XV file format support"
 
-endmenu
-
 endif
-- 
2.7.4
