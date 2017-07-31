From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:35:19 +0200
Subject: [Buildroot] [git commit] configs/armadeus_apf27: bump to kernel
	4.12.4
Message-ID: <20170731173121.CB93A807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fed07953debffb1eb2466d85db15008ca2126844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/23508534

Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../armadeus/apf27/{linux-3.18.config => linux-4.12.config}  | 12 ++----------
 configs/armadeus_apf27_defconfig                             |  8 ++++----
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/board/armadeus/apf27/linux-3.18.config b/board/armadeus/apf27/linux-4.12.config
similarity index 95%
rename from board/armadeus/apf27/linux-3.18.config
rename to board/armadeus/apf27/linux-4.12.config
index ed5a569..d0fb5d3 100644
--- a/board/armadeus/apf27/linux-3.18.config
+++ b/board/armadeus/apf27/linux-4.12.config
@@ -33,9 +33,7 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
-CONFIG_IPV6=y
 CONFIG_CAN=m
 CONFIG_CAN_VCAN=m
 CONFIG_CAN_MCP251X=m
@@ -84,13 +82,13 @@ CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_SMSC_PHY=y
-CONFIG_RTL8187=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_SDIO=m
 CONFIG_RT2X00=m
 CONFIG_RT2500USB=m
 CONFIG_RT73USB=m
 CONFIG_RT2800USB=m
+CONFIG_RTL8187=m
 CONFIG_RTL8192CU=m
 CONFIG_ZD1211RW=m
 CONFIG_INPUT_JOYDEV=y
@@ -125,11 +123,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_USB_PWC=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SOC_CAMERA=m
-CONFIG_VIDEO_MX2=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
-# CONFIG_DVB_AU8522_V4L is not set
-# CONFIG_DVB_TUNER_DIB0070 is not set
-# CONFIG_DVB_TUNER_DIB0090 is not set
 CONFIG_FB=y
 # CONFIG_FB_MX3 is not set
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
@@ -157,7 +151,6 @@ CONFIG_USB_PRINTER=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_CHIPIDEA_DEBUG=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_FTDI_SIO=y
 CONFIG_USB_SERIAL_PL2303=y
@@ -185,8 +178,8 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1374=y
 CONFIG_RTC_DRV_MXC=m
 CONFIG_DMADEVICES=y
-CONFIG_IMX_SDMA=y
 CONFIG_IMX_DMA=y
+CONFIG_IMX_SDMA=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_MAX1027=y
@@ -219,6 +212,5 @@ CONFIG_DEBUG_FS=y
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_LL=y
 CONFIG_EARLY_PRINTK=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index fd0ba50..6f78b74 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -18,9 +18,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.18.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-4.12.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
