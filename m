From: James Hebden <james@hebden.net.au>
Date: Sat, 14 Feb 2015 09:22:30 +1100
Subject: [Buildroot] [PATCH 1/1] Added Raspberry Pi 2 defconfig
Message-ID: <1423866150-23697-1-git-send-email-james@hebden.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v2 -> v3
  - Reformatted defonfig using make savedefconfig

Changes v1 -> v2

  - Removed custom kernel configuration, used default kernel config for 
bcm2709
  - Removed changes to rpi-firmware package, separate patch coming
  - Enabled EABIhf

Signed-off-by: James Hebden <james@hebden.net.au>
---
 configs/raspberrypi2_defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/raspberrypi2_defconfig

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
new file mode 100644
index 0000000..571b026
--- /dev/null
+++ b/configs/raspberrypi2_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="087966e5e3bafdeb9f9ac7578f4995c7cc7ecf1d"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_PACKAGE_RPI_FIRMWARE=y
-- 
2.1.4
