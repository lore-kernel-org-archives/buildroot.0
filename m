From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:57 +0100
Subject: [Buildroot] [PATCH 28/84 RFC] package/sdl_image: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <e50e21390ded31122fc239739fe892c70c1d5348.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.9.1
