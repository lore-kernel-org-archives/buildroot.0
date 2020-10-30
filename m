From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 08:50:38 +0100
Subject: [Buildroot] [PATCH 1/8] configs/qemu_arm_vexpress_tz_defconfig:
 enable CXX toolchain
Message-ID: <20201030075045.6960-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable C++ toolchain that is needed to build some OP-TEE test
trusted applications once OP-TEE packages bump to release 3.11.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 configs/qemu_arm_vexpress_tz_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 815a7987ca..66ce636ce0 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -51,3 +51,6 @@ BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+
+# optee-test needs toolchain C++
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.17.1
