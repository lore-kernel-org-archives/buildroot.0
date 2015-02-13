From: James Hebden <james@hebden.net.au>
Date: Fri, 13 Feb 2015 20:23:50 +1100
Subject: [Buildroot] [PATCH v2 1/1] Added defconfig for RPi2
In-Reply-To: <1423813491-19453-1-git-send-email-james@hebden.net.au>
References: <1423813491-19453-1-git-send-email-james@hebden.net.au>
Message-ID: <54DDC2A6.8020309@hebden.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hebden <james@hebden.net.au>

Signed-off-by: James Hebden <james@hebden.net.au>
---
Changes v1 -> v2

  - Removed custom kernel configuration, used default kernel config for 
bcm2709
  - Removed changes to rpi-firmware package, separate patch coming
  - Enabled EABIhf


  configs/raspberrypi2_defconfig | 33 +++++++++++++++++++++++++++++++++
  1 file changed, 33 insertions(+)
  create mode 100644 configs/raspberrypi2_defconfig

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
new file mode 100644
index 0000000..6b78472
--- /dev/null
+++ b/configs/raspberrypi2_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+BR2_GCC_TARGET_CPU="cortex-a7"
+BR2_GCC_TARGET_FPU="neon-vfpv4"
+BR2_GCC_TARGET_FLOAT_ABI="hard"
+BR2_GCC_TARGET_MODE="arm"
+BR2_ARCH_HAS_ATOMICS=y
+BR2_BINFMT_SUPPORTS_SHARED=y
+BR2_BINFMT_ELF=y
+BR2_ARM_CPU_HAS_NEON=y
+BR2_ARM_CPU_HAS_VFPV2=y
+BR2_ARM_CPU_HAS_VFPV3=y
+BR2_ARM_CPU_HAS_VFPV4=y
+BR2_ARM_CPU_HAS_ARM=y
+BR2_ARM_CPU_HAS_THUMB2=y
+BR2_ARM_CPU_ARMV7A=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_ARM_INSTRUCTIONS_ARM=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="087966e5e3bafdeb9f9ac7578f4995c7cc7ecf1d"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_PACKAGE_RPI_FIRMWARE=y
-- 
2.1.4
