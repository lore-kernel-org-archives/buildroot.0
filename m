From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:35:18 +0100
Subject: [Buildroot] [git commit] support/testing: remove TestATFMarvell
Message-ID: <20210116211625.0DE10870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22188ff6e0606fb06f9c75c701f673d416921228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There were only two users of Marvell ATF: SolidRun MacchiatoBin board
and ClearFrog GT 8k board. After mv-ddr-marvell package update both
boards switched to upstream ATF. Remove tests for now unused
Marvell ATF.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 08a0b7af2a..e637673f04 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -53,30 +53,3 @@ class TestATFAllwinner(infra.basetest.BRTest):
 
     def test_run(self):
         pass
-
-
-class TestATFMarvell(infra.basetest.BRTest):
-    config = \
-        """
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
-        BR2_TARGET_BINARIES_MARVELL=y
-        BR2_TARGET_MV_DDR_MARVELL=y
-        BR2_TARGET_UBOOT=y
-        BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
-        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
-        BR2_TARGET_UBOOT_NEEDS_DTC=y
-        """
-
-    def test_run(self):
-        pass
