From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:14 +0100
Subject: [Buildroot] [PATCH 22/80 v1] package/sdl_image: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <f2aa77c80a947341116e894ebf13a8f481033183.1452983019.git.yann.morin.1998@free.fr>
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
1.9.1
