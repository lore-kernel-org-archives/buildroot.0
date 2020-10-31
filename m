From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:58:09 +0100
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz_defconfig:
 enable C++ in toolchain
Message-ID: <20201031214540.56DE0868ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57652e1ddbeeb59d12762c269b112eff227a1c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are about to bump the optee-test package to 3.11.0, which
requires C++ support, let's enable C++ support in the
qemu_arm_vexpress_tz_defconfig, which uses optee-test.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_arm_vexpress_tz_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 815a7987ca..5aeb6b4290 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -7,6 +7,9 @@ BR2_ARM_FPU_VFPV3D16=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
 
+# optee-test needs toolchain C++
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
