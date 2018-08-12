From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 16:18:51 +0200
Subject: [Buildroot] [git commit] configs: add missing dependencies of Linux
 on host-openssl
Message-ID: <20180812141312.8E82D8C57B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee74275367d565ee988f92a93e64002e6f529ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Four defconfigs have Linux kernel configuration that need OpenSSL on
the host, but forgot to express this dependency, causing build
failures. This commit adjusts those defconfigs, fixing the following
defconfig builds:

   imx6ulpico_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314839

   imx7dpico_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314841

   mx51evk_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314847

   orangepi_lite_defconfig
   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314883

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6ulpico_defconfig    | 1 +
 configs/imx7dpico_defconfig     | 1 +
 configs/mx51evk_defconfig       | 1 +
 configs/orangepi_lite_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 69d1a8055d..56ae588752 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # wifi firmware for brcm4339
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index 971e4022f2..93e3fd7414 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index d9790ada21..3c2d56132d 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -32,3 +32,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 109861f21c..1c3b99cf1d 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-lite"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RTL8189FS=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
