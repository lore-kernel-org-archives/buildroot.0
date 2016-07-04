From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:12:42 +0200
Subject: [Buildroot] [git commit] package/sdl_image: use 'menuconfig'
	instead of 'config'+'menu'
Message-ID: <20160704212259.B6C2482118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=512e9b4046c93825c59431e94ca9aebc2f53d7a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
