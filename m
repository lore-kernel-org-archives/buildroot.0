From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:24:21 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mesa3d: xvmc
 needs x11
Message-ID: <20200818153621.42B7682671@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dc191efe605e0fdeed4b44be12daca158617617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This is a follow-up patch to

https://git.buildroot.net/buildroot/commit/package/mesa3d?id=e79ee3b0f91aa3eb1b20d86701a195e3bd9a26d3

to make sure that MESA3D_PLATFORMS contains x11 needed by xvmc:
https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=20.1#n510

Fixes
http://autobuild.buildroot.net/results/dae/dae41e30d2ac69b768ec0a5b795a2e559c35bcd3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c35fe399cdae023005a1d156fd913ad6d7f7d177)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ade13ec035..2d6aa3565c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -320,6 +320,7 @@ config BR2_PACKAGE_MESA3D_XVMC
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XLIB_LIBXVMC
 	help
