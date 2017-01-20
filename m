From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:25:48 +1100
Subject: [Buildroot] [git commit] sdl2: X11 support depends on MMU (fork)
Message-ID: <20170120022600.B39C881ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e26fcb76b4e157f89e0d7cb7f2f7019d7561b786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index b73611d..8fc14ee 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -21,11 +21,13 @@ comment "DirectFB video driver needs directfb"
 config BR2_PACKAGE_SDL2_X11
 	bool "X11 video driver"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 
 comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
 
 endif
 
