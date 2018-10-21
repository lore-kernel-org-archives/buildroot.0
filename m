From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:36:38 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] support/testing: fix
 TestATFMarvell test case
Message-ID: <20181021173509.063AB88487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a98905c8885cbe7f73df0cd2f212bf6bdf78d85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

This test case uses a too old U-Boot version, which is affected by the
infamous libfdt header conflict issue. We update U-Boot and ATF to
what is used in the current version of
solidrun_macchiatobin_mainline_defconfig, for which the problem no
longer exists.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/107860312

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 22c2b27249107930ddedb3ed14c575e2ae8254e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_atf.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index ab2239e51e..bb3701baed 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -63,7 +63,7 @@ class TestATFMarvell(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -74,7 +74,7 @@ class TestATFMarvell(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         """
 
