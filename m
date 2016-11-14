From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 14 Nov 2016 18:47:50 +0300
Subject: [Buildroot] [PATCH] config: bump U-Boot to 2016.11-rc3 in synopsys
	defconfigs
Message-ID: <1479138470-47444-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we upgrade U-Boot version to 2016.11-rc3
in "snps_axs101_defconfig" and "snps_axs103_defconfig".

Important fixes: new version fixes U-Boot build for arc700.
Since gcc-6.x "-marc700" option is no longer supported,
"-mcpu=arc700" should be used instead.

We haven't sent it before as we were waiting for U-Boot
2016.11 release. But as it unfortunately hasn't come up yet we
bump U-Boot version to the latest release candidate.
We are going to upgrade it to 2016.11 as soon as the release
comes.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 configs/snps_axs101_defconfig | 2 +-
 configs/snps_axs103_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index f272853..694fe47 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -21,6 +21,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11-rc3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index 75596c9..5c82713 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -22,6 +22,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11-rc3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.6.3
