From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:18:05 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] support/testing: fix
 Marvell ATF source code
Message-ID: <20180501073417.36BFD88285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a750136290c28729c324ccdb3df33f3f9c72b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The version of the ARM Trusted Firmware from Marvell was a Git branch,
not a Git commit, leading to unreproducible results. So let's use a
Git commit instead, which is the latest available from the branch that
was previously used.

More specifically, this branch has recently seen a fix that is needed
for ATF to build properly with recent gcc versions:

  https://github.com/MarvellEmbeddedProcessors/atf-marvell/commit/c96ec59f8b819123a06e1839ab5578030cf263b0

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac260a2acec20f30705fdfd3911ff966c1f4a0df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index c623ab8c8b..75cea01fc8 100644
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
