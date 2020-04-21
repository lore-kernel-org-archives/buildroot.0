From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:42 +0200
Subject: [Buildroot] [PATCHv2 08/12]
 configs/engicam_imx6qdl_icore_qt5_defconfig: needs udev to select glmark2
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 8f9c9326a9..b893c6aead 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -9,6 +9,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.25.3
