From: Mike Frampton <mikeframpo@gmail.com>
Date: Tue, 27 Oct 2020 20:50:54 +1300
Subject: [Buildroot] [PATCH 1/3] configs/qcom_db410c: Add support for
 Dragonboard410c SBC Adds basic support for the DB410c SBC. Builds the
 qualcomm kernel version 5.4 arm64. Adds the device's graphics firmware.
Message-ID: <20201027075056.10753-1-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
---
 configs/qcom_db410c_defconfig | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 configs/qcom_db410c_defconfig

diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
new file mode 100644
index 0000000000..835e34453d
--- /dev/null
+++ b/configs/qcom_db410c_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_aarch64=y
+
+# Toolchain options
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
+BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/landing-teams/working/qualcomm/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="release/qcomlt-5.4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="apq8016-sbc"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
-- 
2.25.1
