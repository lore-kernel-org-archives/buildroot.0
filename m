From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Apr 2018 21:59:54 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: fix Marvell ATF source code
In-Reply-To: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
References: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180423195954.30215-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version of the ARM Trusted Firmware from Marvell was a Git branch,
not a Git commit, leading to unreproducible results. So let's use a
Git commit instead, which is the latest available from the branch that
was previously used.

More specifically, this branch has recently seen a fix that is needed
for ATF to build properly with recent gcc versions:

  https://github.com/MarvellEmbeddedProcessors/atf-marvell/commit/c96ec59f8b819123a06e1839ab5578030cf263b0

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 8288116471..cbb99eb37f 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -63,7 +63,7 @@ class TestATFMarvell(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-- 
2.14.3
