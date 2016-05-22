From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 09:28:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/vice: not available on nios2
In-Reply-To: <1463902120-8275-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463902120-8275-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1463902120-8275-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg is not available on nios2, this limitation was not reverse-
propagated to this package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vice/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vice/Config.in b/package/vice/Config.in
index 1b9dee0..5f2c83d 100644
--- a/package/vice/Config.in
+++ b/package/vice/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_VICE
 	select BR2_PACKAGE_SDL_SOUND
 	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ZLIB
+	depends on !BR2_nios2 # ffmpeg
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
@@ -28,5 +29,6 @@ config BR2_PACKAGE_VICE
 	  http://vice-emu.sourceforge.net
 
 comment "vice needs a toolchain w/ dynamic library, threads"
+	depends on !BR2_nios2 # ffmpeg
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.8.1
