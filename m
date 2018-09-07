From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:58 -0000
Subject: [Buildroot] [git commit] configs/arm_juno: bump ATF to v1.3
Message-ID: <20180907111547.001F37F981@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ddc039d0c044b3e574390ba27eb06ed0e845d2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ATF in version 1.2 fails to build with:

./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'

This has been fixed in ATF v1.3. Even though there are even newer
versions of ATF available, we take a conservative approach, and bump
to the first version that has the build issue fixed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/88314771

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/arm_juno_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 54506d8061..98f257387d 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
