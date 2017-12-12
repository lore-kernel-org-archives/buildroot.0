From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 09:36:30 +0100
Subject: [Buildroot] [git commit] support/testing: TestATFMarvell needs
 BR2_TARGET_UBOOT_NEEDS_DTC=y
Message-ID: <20171212082922.F328080AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7794ce50899bc06fc59ba1a882e00bf10422658c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Marvell U-Boot needs DTC to build, so the test case fails to build
on systems where dtc isn't available. We add
BR2_TARGET_UBOOT_NEEDS_DTC=y to make sure that we build our own DTC.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/44126707

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/boot/test_atf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 02f93b9..f1e58af 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -73,6 +73,7 @@ class TestATFMarvell(infra.basetest.BRTest):
     BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
     BR2_TARGET_UBOOT_CUSTOM_VERSION=y
     BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+    BR2_TARGET_UBOOT_NEEDS_DTC=y
     """
 
     def test_run(self):
