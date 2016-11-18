From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 22:30:09 +0100
Subject: [Buildroot] [git commit] configs: snps_aarch64_vdk_defconfig:
	kernel pointing to 4.6
Message-ID: <20161119093658.0E91C81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9eeadbcc340c5e345d7c4d96b572e0e37f262da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously the vdk solution was using a Linaro kernel that doesn't
build with gcc 5.x.

Since there is no point in using Linaro anymore for this solution,
this patch makes the aarch64 vdk defconfig point to the 4.6 Linux
kernel.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
