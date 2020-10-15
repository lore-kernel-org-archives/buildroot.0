From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Oct 2020 22:49:00 -0300
Subject: [Buildroot] [PATCH 1/3] configs/freescale_imx8: Use NXP specific
 defconfig
Message-ID: <20201015014902.3486-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the imx8 NXP kernel, it is preferred to use the imx_v8_defconfig
instead of the generic arm64 defconfig, as the NXP defconfig selects more
imx8 specific drivers.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/freescale_imx8mmevk_defconfig  | 2 +-
 configs/freescale_imx8mnevk_defconfig  | 2 +-
 configs/freescale_imx8mqevk_defconfig  | 2 +-
 configs/freescale_imx8qmmek_defconfig  | 2 +-
 configs/freescale_imx8qxpmek_defconfig | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index 7bce834ab8..508bcd32cd 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mm-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index e1804fad4c..8c795fe217 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-ddr4-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index 62e530840d..ffdc23bc26 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 2c55b3cd9f..45b4dbd1b9 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qm-mek"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index 2c35055565..7c4a456c2a 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -9,7 +9,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qxp-mek"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.17.1
