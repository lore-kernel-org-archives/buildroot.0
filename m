From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 19 Jan 2017 22:53:27 +0100
Subject: [Buildroot] [PATCH] SDL2_X11 depends on MMU (fork)
Message-ID: <20170119215327.10668-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guillaume GARDET <guillaume.gardet@oliseo.fr>

Fixes autobuilder failure http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Cc: baruch at tkos.co.il
Cc: romain.naour at gmail.com
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Guillaume's email sent with git send-email seems rejected by the mailing list server...
---
 package/sdl2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index b73611d..1d83c98 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -21,6 +21,7 @@ comment "DirectFB video driver needs directfb"
 config BR2_PACKAGE_SDL2_X11
 	bool "X11 video driver"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 
-- 
2.9.3
