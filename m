From: Dick Olsson <hi@senzilla.io>
Date: Wed, 22 Jul 2020 07:11:54 +0000
Subject: [Buildroot] [PATCH v2 4/4] configs/qemu_arm_vexpress_tz_defconfig:
 bump ATF version, cleanup config
Message-ID: <20200722071030.16128-5-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to a later version of ATF and cleanup the Python configuration.
Previously this configuration had to work around Python 3 issues with OP-TEE.
Now this relies on OP-TEE properly building itself with host-python3.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 configs/qemu_arm_vexpress_tz_defconfig | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 37244cc969..12fe375687 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -27,7 +27,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
 # TF-A for booting OP-TEE secure and uboot/linux non secure
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -40,12 +40,7 @@ BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
 BR2_PACKAGE_OPTEE_TEST=y
 
-# OP-TEE components needs host-python3 interpreter and its modules
-BR2_PACKAGE_HOST_PYTHON3=y
-# Select python3 on the target to make sure Buildroot builds host-python using
-# python3 and builds all host-python modules for python3.
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PACKAGE_PYTHON3=y
 
 # U-boot for booting the dear Linux kernel
 BR2_TARGET_UBOOT=y
-- 
2.20.1
