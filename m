From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Sun, 11 Aug 2019 16:58:55 +0200
Subject: [Buildroot] [PATCH 3/4] configs/acmesystems_arietta_g25: update
 default configuration for both 128MB and 256MB version
In-Reply-To: <20190811145856.27420-1-biagio.hkr@gmail.com>
References: <20190811145856.27420-1-biagio.hkr@gmail.com>
Message-ID: <20190811145856.27420-3-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump Linux version to 4.19
* Use default 'genimage' post-image script (support/scripts/genimage.sh)
  to build sdcard.img
* Bump AT91bootstrap version to 3.8.13

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 configs/acmesystems_arietta_g25_128mb_defconfig | 10 ++++++----
 configs/acmesystems_arietta_g25_256mb_defconfig | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index a68ac57ff7..d66d80d5ab 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -1,19 +1,21 @@
 # Architecture
 BR2_arm=y
+BR2_arm926t=y
 
 # Kernel headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
@@ -27,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
 # Tools to build sdcard.img
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index ce9ebacb8d..5104291c48 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -1,19 +1,21 @@
 # Architecture
 BR2_arm=y
+BR2_arm926t=y
 
 # Kernel headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
@@ -27,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
 # Tools to build sdcard.img
-- 
2.17.1
