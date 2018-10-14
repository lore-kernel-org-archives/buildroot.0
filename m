From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 15:25:58 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: fix TestATFAllwinner test
 case
Message-ID: <20181014132559.2262-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This test case uses a too old U-Boot version, which is affected by the
infamous libfdt header conflict issue. Let's update to U-Boot 2017.11,
which is used by our current bananapi_m64_defconfig that was the
inspiration for this test case.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/107860310

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 75cea01fc8..ab2239e51e 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -40,7 +40,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.14.4
