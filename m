From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 19:54:57 +0100
Subject: [Buildroot] [git commit] configs: nitrogen*: bump kernel and u-boot
	revisions
Message-ID: <20170124185653.B74C17FC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93e11be01673b74bac6d83d13d0de7c565813de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Here are the main U-Boot modifications:
- Fix second Ethernet port for SoloX
- Fix LCD disable sequence
- Fix LVDS2 as primary display

Here are the main Linux modifications:
- Rebase on top of NXP 4.1.15_2.0.0 branch
- Fix touch screens interrupt conflicts
- Backport tw686x features from mainline
- Fix multiple ft5x06 touch instantiation
- Fix dirty cow vulnerability
- Various improvements to TC358743 driver

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6sx_defconfig | 6 +++---
 configs/nitrogen6x_defconfig  | 6 +++---
 configs/nitrogen7_defconfig   | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 3509ef0..6bb9953 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -26,13 +26,13 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1ac27109.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/207addbe.tar.gz"
+# Last version of branch boundary-imx_4.1.15_2.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 9eb0daa..48bb114 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -26,13 +26,13 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1ac27109.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/207addbe.tar.gz"
+# Last version of branch boundary-imx_4.1.15_2.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index e1fd58b..b027fb7 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/1ac27109.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/207addbe.tar.gz"
+# Last version of branch boundary-imx_4.1.15_2.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
