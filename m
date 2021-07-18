From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:33:03 +0200
Subject: [Buildroot] [git commit] configs: remove mesa3d kmsro-related
 options
Message-ID: <20210718095913.532CE84B94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=60a13de87542cf9c00858ce2298d6f74f7e113ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed kmsro-related options, these are now handled by the mesa3d
build system:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=70813c1c13b99cb029c8fa3537163650bdd17b6d

The removal commit of the buildroot option
https://git.buildroot.net/buildroot/commit/package/mesa3d?id=d51736f47296e3681cdb610765c73424272d42db

forgot to update the defconfigs, fixes
https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066565

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
