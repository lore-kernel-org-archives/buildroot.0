From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Aug 2016 19:09:49 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: bump kernel and u-boot
	version for m4 support
Message-ID: <1470244189-32091-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adding the '-m4' device tree blobs which allow to disable the
peripherals that are used by the Cortex-M4.

The 6x_bootscript is already setup to load the '-m4' dtb if m4enabled
u-boot variable is set to 1.

The FreeRTOS BSP for both Nitrogen6SX and Nitrogen7 can be found here:
https://github.com/boundarydevices/freertos-boundary

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Sorry I just bumped the kernel to 4.1.15 and U-Boot to v2016.03 last week but
a request has been made to support the Cortex-M4 of the i.MX6SoloX and the
i.MX7D (based on the same 4.1.15/2016.03 versions).

The differences between the previous version and this one are:
- Updated U-Boot default environment to be able to flash, load and boot a M4
  firmware on our boards
- Updated U-Boot defconfig to include 'bootaux' command and RDC control
- Updated device trees to disable peripherals used by the MCU

The Nitrogen6x defconfig didn't need to be updated since i.MX6Q/DL do not have
a Cortex-M4, but its version was bumped to be consistent with the other two.

Regards,
Gary
---
 configs/nitrogen6sx_defconfig | 6 +++---
 configs/nitrogen6x_defconfig  | 4 ++--
 configs/nitrogen7_defconfig   | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index d776566..bd92f55 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -23,14 +23,14 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/12f31130.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8a73de91.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/be36042a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx imx6sx-nitrogen6sx-m4"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 5b2b56a..85acabe 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -23,13 +23,13 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/12f31130.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8a73de91.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/be36042a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index a01f533..a8f3b45 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -24,14 +24,14 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/ed95621f.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/12f31130.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8a73de91.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/be36042a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-nitrogen7"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-nitrogen7 imx7d-nitrogen7-m4"
-- 
2.8.1
