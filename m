From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 17:04:16 +0200
Subject: [Buildroot] [git commit] configs: chromebook snow: bump to linux
	4.6.3
Message-ID: <20160704150424.647CA81E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=541c0856a7f5ea2950665da386a978b415762f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No significant changes but 4.6.3 moved parts of the device tree
into a different file, so dts patch must be updated.

[Peter: explicitly configure kernel headers for 4.6]
Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../snow/{linux-4.3-dts-tpm.patch => linux-4.6-dts-tpm.patch}     | 7 ++++---
 board/chromebook/snow/{linux-4.3.fragment => linux-4.6.fragment}  | 0
 configs/chromebook_snow_defconfig                                 | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/chromebook/snow/linux-4.3-dts-tpm.patch b/board/chromebook/snow/linux-4.6-dts-tpm.patch
similarity index 82%
rename from board/chromebook/snow/linux-4.3-dts-tpm.patch
rename to board/chromebook/snow/linux-4.6-dts-tpm.patch
index 4a9dd85..c71ff1b 100644
--- a/board/chromebook/snow/linux-4.3-dts-tpm.patch
+++ b/board/chromebook/snow/linux-4.6-dts-tpm.patch
@@ -10,9 +10,9 @@ and https://lkml.org/lkml/2013/3/4/242
 
 Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 
---- a/arch/arm/boot/dts/exynos5250-snow.dts
-+++ b/arch/arm/boot/dts/exynos5250-snow.dts
-@@ -474,6 +474,11 @@
+--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
++++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+@@ -466,6 +466,11 @@
  	status = "okay";
  	samsung,i2c-sda-delay = <100>;
  	samsung,i2c-max-bus-freq = <66000>;
@@ -24,3 +24,4 @@ Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
  };
  
  &i2c_5 {
+
diff --git a/board/chromebook/snow/linux-4.3.fragment b/board/chromebook/snow/linux-4.6.fragment
similarity index 100%
rename from board/chromebook/snow/linux-4.3.fragment
rename to board/chromebook/snow/linux-4.6.fragment
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index b96441d..70cd42b 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,16 +1,16 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.6"
-BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.3-dts-tpm.patch"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.6-dts-tpm.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.3.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.6.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
 BR2_PACKAGE_LINUX_FIRMWARE=y
