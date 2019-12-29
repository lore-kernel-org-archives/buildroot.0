From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Dec 2019 14:14:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: XvMC needs x11
Message-ID: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selects BR2_PACKAGE_MESA3D_NEEDS_X11 hidden option to enable x11
platform if the user selects BR2_PACKAGE_MESA3D_XVMC

Fixes:
 - http://autobuild.buildroot.org/results/e044609e603ca68695d842d08809fdcb35bc8127

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 455091eb9d..844360950c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -260,6 +260,7 @@ config BR2_PACKAGE_MESA3D_XVMC
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XLIB_LIBXVMC
 	help
-- 
2.24.0
