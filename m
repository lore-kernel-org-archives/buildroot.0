From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 13 Feb 2021 21:22:30 +0300
Subject: [Buildroot] [PATCH 1/1] support/testing: TestATFAllwinner needs
 python3 for u-boot
Message-ID: <20210213182230.601340-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New U-Boot version needs Python 3.x for pylibfdt.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385909

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 support/testing/tests/boot/test_atf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index c23b9d8aba..e6c11aa742 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -44,6 +44,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
+        BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
         BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.30.1
