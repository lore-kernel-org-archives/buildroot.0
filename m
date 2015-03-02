From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:16 -0000
Subject: [Buildroot] [git commit] armadeus apf27: update kernel to 3.18.6
Message-ID: <20150302222715.EDE0D8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f991684cf7adc879a043b3d08d8ac0c995f53813
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../apf27/{linux-3.13.config => linux-3.18.config} |   26 +++++++------------
 configs/armadeus_apf27_defconfig                   |    8 +++---
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/board/armadeus/apf27/linux-3.13.config b/board/armadeus/apf27/linux-3.18.config
similarity index 96%
rename from board/armadeus/apf27/linux-3.13.config
rename to board/armadeus/apf27/linux-3.18.config
index d2955cf..ed5a569 100644
--- a/board/armadeus/apf27/linux-3.13.config
+++ b/board/armadeus/apf27/linux-3.18.config
@@ -17,14 +17,11 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_MXC=y
-CONFIG_MXC_IRQ_PRIOR=y
 CONFIG_MACH_IMX27_DT=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_FPE_NWFPE=y
-CONFIG_FPE_NWFPE_XP=y
 CONFIG_PM_DEBUG=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -40,8 +37,6 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_DIAG is not set
 CONFIG_IPV6=y
 CONFIG_CAN=m
-CONFIG_CAN_RAW=m
-CONFIG_CAN_BCM=m
 CONFIG_CAN_VCAN=m
 CONFIG_CAN_MCP251X=m
 CONFIG_BT=m
@@ -60,7 +55,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
@@ -72,13 +66,11 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_MXC=y
 CONFIG_MTD_UBI=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
-CONFIG_MII=y
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
@@ -144,8 +136,6 @@ CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
@@ -162,21 +152,21 @@ CONFIG_SND_IMX_SOC=m
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_MXC=y
-CONFIG_USB_CHIPIDEA=y
-CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_CHIPIDEA_DEBUG=y
 CONFIG_USB_ACM=y
 CONFIG_USB_PRINTER=y
 CONFIG_USB_STORAGE=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_DEBUG=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_FTDI_SIO=y
 CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_ETH=m
 CONFIG_USB_GADGETFS=m
 CONFIG_USB_MASS_STORAGE=m
 CONFIG_USB_G_HID=m
-CONFIG_USB_ULPI=y
 CONFIG_MMC=y
 CONFIG_MMC_MXC=y
 CONFIG_NEW_LEDS=y
@@ -198,7 +188,9 @@ CONFIG_DMADEVICES=y
 CONFIG_IMX_SDMA=y
 CONFIG_IMX_DMA=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_IIO=m
+CONFIG_IIO=y
+CONFIG_MAX1027=y
+CONFIG_MAX5821=y
 CONFIG_PWM=y
 CONFIG_PWM_IMX=y
 CONFIG_EXT2_FS=y
@@ -220,11 +212,13 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_15=m
 CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_DEBUG_INFO=y
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_LL=y
 CONFIG_EARLY_PRINTK=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 7e33a41..b779e6b 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,8 +4,8 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -21,9 +21,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.18.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
