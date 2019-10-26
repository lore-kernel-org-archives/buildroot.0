From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Oct 2019 16:34:44 -0300
Subject: [Buildroot] [PATCH 1/2] configs/engicam_imx6qdl_icore_qt5: Select
 the KMSRO gallium driver
Message-ID: <20191026193445.25227-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After migrating to Mesa 19.2 the imx-drm_dri.so is no longer installed
unless the kmsro gallium driver is selected, so explicitly select
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO to fix the problem.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 2da0a65c83..b591c98f23 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -61,6 +61,7 @@ BR2_PACKAGE_QT5BASE_JPEG=y
 # mesa3d
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
-- 
2.17.1
