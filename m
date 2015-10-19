From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 19 Oct 2015 17:02:34 +0200
Subject: [Buildroot] [PATCH 3/3] nitrogen6*_defconfig: bump u-boot and
	kernel revisions
In-Reply-To: <1445266954-15149-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1445266954-15149-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1445266954-15149-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This update brings several improvements such as:
- switch to a generic Boundary defconfig
  - same across all the Boundary Devices platforms
- support of HDMI to MIPI daugther board
https://boundarydevices.com/product/bd_hdmi_mipi/
- enhanced display support
  - LCD ASIT500MA6F5D
  - LCD A030JN01
  - HDMI 480p

For a complete list of changes:
https://github.com/boundarydevices/linux-imx6/commits/d7a412b
https://github.com/boundarydevices/u-boot-imx6/commits/a4070a8

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 6 +++---
 configs/nitrogen6x_defconfig  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 3cdf41b..3670798 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -23,14 +23,14 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2015.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/5115a9e/u-boot-5115a9e.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/a4070a8/u-boot-a4070a8.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_3.14.28_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/d7a412b/linux-imx6-d7a412b.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index cffbc25..979bf09 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -23,14 +23,14 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2015.07
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/5115a9e/u-boot-5115a9e.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/a4070a8/u-boot-a4070a8.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_3.14.28_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/d7a412b/linux-imx6-d7a412b.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.6.1
