From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 21 Sep 2016 11:37:20 +0200
Subject: [Buildroot] [PATCH 2/3] Update configuration files of Acme Systems
	Aria G25
In-Reply-To: <1474450641-7816-1-git-send-email-biagio.hkr@gmail.com>
References: <1474450641-7816-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1474450641-7816-2-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Improve Buildroot configuration for Aria G25 (both 128M and 256M version)
in order to use the 3.8.6 version of AT91bootstrap

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig | 7 ++-----
 configs/acmesystems_aria_g25_256mb_defconfig | 7 ++-----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index 72444ea..57cf781 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 
-# Kernel header
+# Kernel headers
 BR2_KERNEL_HEADERS_4_7=y
 
 # System configuration
@@ -22,11 +22,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# AT91bootstrap bootloader
+# AT91bootstrap bootloader v3.8.6
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
 
 # Tools to build sdcard.img
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 4afc120..1f5c091 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 
-# Kernel header
+# Kernel headers
 BR2_KERNEL_HEADERS_4_7=y
 
 # System configuration
@@ -22,11 +22,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# AT91bootstrap bootloader
+# AT91bootstrap bootloader v3.8.6
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
 
 # Tools to build sdcard.img
-- 
2.7.4
