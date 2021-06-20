From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jun 2021 10:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] configs: remove mesa3d kmsro-related options
Message-ID: <20210620083630.5813-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed kmsro-related options, these are now handled by the mesa3d
build system:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=70813c1c13b99cb029c8fa3537163650bdd17b6d

The removal commit of the buildroot option
https://git.buildroot.net/buildroot/commit/package/mesa3d?id=d51736f47296e3681cdb610765c73424272d42db

forgot to update the defconfigs, fixes
https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066565

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 -
 configs/imx6-sabresd_qt5_defconfig          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index b893c6aead..2d213e4ab9 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -61,7 +61,6 @@ BR2_PACKAGE_QT5BASE_JPEG=y
 # mesa3d
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 8cdc0e2544..1330b5cfbf 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -48,7 +48,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # GL driver
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 
-- 
2.30.2
