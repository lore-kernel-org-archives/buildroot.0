From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Apr 2018 22:14:56 +0200
Subject: [Buildroot] [PATCH] support/testing: fix ATF Vexpress test case
Message-ID: <20180423201456.3303-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This test case currently fails to build with:

./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'

This issue has been fixed upstream in commit
10c252c14b7f446c0b49ef1aafbd5d37804577dd, available since v1.3. So
while we bump, let's bump to the latest version of ATF, v1.5.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/64360659

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index cbb99eb37f..75cea01fc8 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -10,7 +10,7 @@ class TestATFVexpress(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-- 
2.14.3
