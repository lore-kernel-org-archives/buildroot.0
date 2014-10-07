From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 00:25:59 +0200
Subject: [Buildroot] [git commit] configs/olimex_imx233_olinuxino: bump
	kernel to version 3.17
Message-ID: <20141007222740.28550B11B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed4e304925254f65c15e7741ee69c30309e5ac5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The audio patch has not been upstreamed and no longer applies.

[Peter: explain why patch is dropped]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.16.config => linux-3.17.config}       |   20 --------------------
 configs/olimex_imx233_olinuxino_defconfig          |    9 ++++-----
 2 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/linux-3.16.config b/board/olimex/imx233_olinuxino/linux-3.17.config
similarity index 86%
rename from board/olimex/imx233_olinuxino/linux-3.16.config
rename to board/olimex/imx233_olinuxino/linux-3.17.config
index 4795023..d46d4d5 100644
--- a/board/olimex/imx233_olinuxino/linux-3.16.config
+++ b/board/olimex/imx233_olinuxino/linux-3.17.config
@@ -1,17 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
-CONFIG_TASKSTATS=y
-CONFIG_TASK_DELAY_ACCT=y
-CONFIG_TASK_XACCT=y
-CONFIG_TASK_IO_ACCOUNTING=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-# CONFIG_UTS_NS is not set
-# CONFIG_IPC_NS is not set
-# CONFIG_PID_NS is not set
-# CONFIG_NET_NS is not set
-CONFIG_RELAY=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MODULES=y
@@ -20,8 +9,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_MXS=y
 # CONFIG_ARM_THUMB is not set
@@ -37,12 +24,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
@@ -123,7 +104,6 @@ CONFIG_SND_HRTIMER=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
-CONFIG_SND_MXS_SOC_BUILTIN=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index d516cb4..cbe4504 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -15,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Bootloader
 BR2_TARGET_MXS_BOOTLETS=y
@@ -27,10 +27,9 @@ BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.16.config"
-BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.17.config"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
 
