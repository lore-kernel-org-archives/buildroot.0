From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 23:05:26 +0100
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz_defconfig:
 enable openssl library
Message-ID: <20210320214133.D040D875E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a662a0134549931ff71f0ca7022aea9c3dd469a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the OpenSSL library to enable some OP-TEE tests that relies on
it.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 602bdaf304..2f5189b8eb 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -43,6 +43,10 @@ BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
 BR2_PACKAGE_OPTEE_TEST=y
 
+# Enable OpenSSL library for some optee-test tests
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_LIBOPENSSL=y
+
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
