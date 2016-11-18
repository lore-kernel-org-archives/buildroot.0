From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Fri, 18 Nov 2016 18:01:56 +0000
Subject: [Buildroot] [PATCH] configs: snps_aarch64_vdk_defconfig: kernel
	pointing to 4.6
Message-ID: <0a6fcad277c1a7408815a57d9e138272feb0dfed.1479491815.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously the vdk solution was using a linaro kernel that is currently
having build problems.
Since there is no point in using Linaro anymore for this solution,
this patch makes the aarch64 vdk solution point to 4.6 linux kernel.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 configs/snps_aarch64_vdk_defconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
index f165a9a..b55dce1 100644
--- a/configs/snps_aarch64_vdk_defconfig
+++ b/configs/snps_aarch64_vdk_defconfig
@@ -1,12 +1,10 @@
 BR2_aarch64=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
 BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-aarch64-defconfig"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.9.3
