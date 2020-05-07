From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:53:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 configs/engicam_imx6qdl_icore_qt5_defconfig: needs udev to select glmark2
Message-ID: <20200507214107.A865F8FEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af5872534149d5a00351e353ad063c8ea32f6209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The BR2_PACKAGE_GLMARK2 is lost while loading the defconfig with:
make engicam_imx6qdl_icore_qt5_defconfig

In order to select gmark2 package, BR2_PACKAGE_GLMARK2_FLAVOR_ANY option
must be set.

Based on the defconfig without X11 and wayland package, the only missing
option to select BR2_PACKAGE_GLMARK2_FLAVOR_ANY is BR2_PACKAGE_HAS_UDEV.
The only possible option is to enable one of the udev provider
(eudev or systemd). Select eudev package for /dev management.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6dd11cefb8697bc4e2004f794a161695f1cf5f46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index e0c1fd6a02..fdbca331a0 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -9,6 +9,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
