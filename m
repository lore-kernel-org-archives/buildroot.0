From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 5 Mar 2018 17:01:05 +0200
Subject: [Buildroot] [PATCH] chromebook snow: bump kernel to 4.15
Message-ID: <fe35b377bd97f073334568abff309fb148e9220f.1520261245.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No other changes necessary, 4.15 builds and boots fine.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 .../snow/{linux-4.6-dts-tpm.patch => linux-4.15-dts-tpm.patch}    | 0
 board/chromebook/snow/{linux-4.6.fragment => linux-4.15.fragment} | 0
 configs/chromebook_snow_defconfig                                 | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename board/chromebook/snow/{linux-4.6-dts-tpm.patch => linux-4.15-dts-tpm.patch} (100%)
 rename board/chromebook/snow/{linux-4.6.fragment => linux-4.15.fragment} (100%)

diff --git a/board/chromebook/snow/linux-4.6-dts-tpm.patch b/board/chromebook/snow/linux-4.15-dts-tpm.patch
similarity index 100%
rename from board/chromebook/snow/linux-4.6-dts-tpm.patch
rename to board/chromebook/snow/linux-4.15-dts-tpm.patch
diff --git a/board/chromebook/snow/linux-4.6.fragment b/board/chromebook/snow/linux-4.15.fragment
similarity index 100%
rename from board/chromebook/snow/linux-4.6.fragment
rename to board/chromebook/snow/linux-4.15.fragment
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index 70cd42bb75..5558c101d6 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,16 +1,16 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
-BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.6-dts-tpm.patch"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.15-dts-tpm.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.6.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.15.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.16.1
