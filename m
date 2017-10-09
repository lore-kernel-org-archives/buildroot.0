From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 9 Oct 2017 14:50:32 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: Add VPU decoding support
Message-ID: <1507571432-18190-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mainline kernel is able to decode video via the coda driver.

Add support for it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx6-sabresd/linux_qt5.fragment |  1 +
 configs/imx6-sabresd_qt5_defconfig              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/board/freescale/imx6-sabresd/linux_qt5.fragment b/board/freescale/imx6-sabresd/linux_qt5.fragment
index ffa5f63..d4f26b1 100644
--- a/board/freescale/imx6-sabresd/linux_qt5.fragment
+++ b/board/freescale/imx6-sabresd/linux_qt5.fragment
@@ -2,3 +2,4 @@
 # ondemand governor with a mainline kernel.
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+CONFIG_VIDEO_CODA=m
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 832e326..7199cb0 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -75,3 +75,23 @@ BR2_PACKAGE_QT5BASE_GIF=y
 BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_PACKAGE_QT5CINEX=y
 BR2_PACKAGE_QT5CINEX_HD=y
+
+# NXP firmware package
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# libdrm tests
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+
+# gstreamer-1.0
+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE=y
+BR2_PACKAGE_GST1_PLUGINS_BAD=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
+
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.7.4
