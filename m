From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 23:09:29 +0200
Subject: [Buildroot] [git commit] configs/stm32mp157: remove extra
 metadata_csum mkfs option
Message-ID: <20200908210440.7C5B38893B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=238909285433bf60bdc7ced28c7b2d3a94daa9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit [1] in U-Boot upstrea, there is no necessity to pass extra
metadata_csum option due to changed env location in U-Boot so we can
drop it completely.

[1] 76db1681da52342ca9f4fb7e6787bd83cc82f429:
stm32mp1: use a specific SD/eMMC partition for U-Boot enviromnent

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr: 76db1681d referecnes a U-Boot commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/stm32mp157a_dk1_defconfig | 1 -
 configs/stm32mp157c_dk2_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index be5ea7581f..f172539c02 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -15,7 +15,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 86e1551a30..49cfb0733c 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -15,7 +15,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
