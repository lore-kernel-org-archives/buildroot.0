From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:34 -0200
Subject: [Buildroot] [PATCH 06/14] testing/tests/boot/test_atf: fix code
 style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-7-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E122 continuation line missing indentation or outdented
E302 expected 2 blank lines, found 1
F401 'os' imported but unused

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/boot/test_atf.py | 124 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 61 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index f1e58af..8288116 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,80 +1,82 @@
-import os
 import infra.basetest
 
+
 class TestATFVexpress(infra.basetest.BRTest):
     config = \
-    """
-    BR2_aarch64=y
-    BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-    BR2_TARGET_UBOOT=y
-    BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
-    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
-    BR2_TARGET_VEXPRESS_FIRMWARE=y
-    """
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
+        BR2_TARGET_VEXPRESS_FIRMWARE=y
+        """
 
     def test_run(self):
         pass
 
+
 class TestATFAllwinner(infra.basetest.BRTest):
     config = \
-    """
-    BR2_aarch64=y
-    BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-    BR2_TARGET_UBOOT=y
-    BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
-    BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
-    BR2_TARGET_UBOOT_NEEDS_DTC=y
-    BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-    BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-    BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-    BR2_TARGET_UBOOT_SPL=y
-    BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-    """
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+        BR2_TARGET_UBOOT_NEEDS_DTC=y
+        BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+        BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+        BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+        BR2_TARGET_UBOOT_SPL=y
+        BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+        """
 
     def test_run(self):
         pass
 
+
 class TestATFMarvell(infra.basetest.BRTest):
     config = \
-    """
-    BR2_aarch64=y
-    BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-    BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
-    BR2_TARGET_BINARIES_MARVELL=y
-    BR2_TARGET_BINARIES_MARVELL_8040=y
-    BR2_TARGET_MV_DDR_MARVELL=y
-    BR2_TARGET_UBOOT=y
-    BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
-    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
-    BR2_TARGET_UBOOT_NEEDS_DTC=y
-    """
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+        BR2_TARGET_BINARIES_MARVELL=y
+        BR2_TARGET_BINARIES_MARVELL_8040=y
+        BR2_TARGET_MV_DDR_MARVELL=y
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+        BR2_TARGET_UBOOT_NEEDS_DTC=y
+        """
 
     def test_run(self):
         pass
-- 
2.7.4
