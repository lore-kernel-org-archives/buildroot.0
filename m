From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 22:14:24 +0200
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/boot/test_atf: DTC needed for ATF Vexpress test
Message-ID: <20200812144329.9EA3785F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e3397cfab7d4a3de163804ed3a55d04ea96a16f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of ATF to 2.2 for the ATF Vexpress test case in commit
fc3d6a3ed0f5f1ceda7ab64b8b2bee88abd29373
("support/testing/tests/boot/test_atf: update U-Boot/ATF use in
TestATFVexpress"), DTC is now needed otherwise the build fails with:

make[2]: dtc: Command not found
Makefile:873: recipe for target 'build/juno/release/fdts/juno_tb_fw_config.dtb' failed

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934470

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 678c13de5b..08a0b7af2a 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -14,6 +14,7 @@ class TestATFVexpress(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
