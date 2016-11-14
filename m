From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 14 Nov 2016 21:07:00 +0300
Subject: [Buildroot] [PATCH v2] config: bump U-Boot to 2016.11 in synopsys
	defconfigs
Message-ID: <1479146820-46777-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we upgrade U-Boot version to 2016.11
in "snps_axs101_defconfig" and "snps_axs103_defconfig".

Important fixes: new version fixes U-Boot build for arc700.
Since gcc-6.x "-marc700" option is no longer supported,
"-mcpu=arc700" should be used instead.

We haven't sent it before as we were waiting for U-Boot
2016.11 release.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
Changes v1..v2
 - Replace 2016.11-rc3 release candidate with 2016.11 release version

 configs/snps_axs101_defconfig | 2 +-
 configs/snps_axs103_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index f272853..dbc5003 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -21,6 +21,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index 75596c9..93a62b2 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -22,6 +22,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.6.3
