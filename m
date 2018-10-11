From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:29:10 +0200
Subject: [Buildroot] [git commit] configs/solidrun_macchiatobin_marvell:
 bump component versions
Message-ID: <20181011072918.CA4267FBC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53a9e432fb24e77dbe7e50b50d76dfbae1c6f254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to armada-18.09, U-Boot to armada-18.09.1 and ATF to
armada-18.09.4.

Note that we continue to use the Linux 4.4.x kernel provided by
Marvell, and not yet their Marvell 4.14.x version. Indeed Marvell
currently considers its 4.4.x BSP as the feature-complete and stable
one, while 4.14.x is in development/QA and is expected to become the
new default BSP by the end of 2018. So let's stick with 4.4.x for now,
since the aim of this defconfig is to provide the vendor BSP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/solidrun_macchiatobin_marvell_defconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
index acc8d1589e..4b52e47945 100644
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -7,7 +7,8 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
+# This commit corresponds to release armada-18.09.4
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -20,14 +21,15 @@ BR2_TARGET_MV_DDR_MARVELL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2017.03-armada-17.10"
+# This commit corresponds to armada-18.09.1, based on u-boot 2018.03
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="8fe403172c58440bcfbb3724242301c0108eff5b"
 BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.52-armada-17.10.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.120-armada-18.09.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
