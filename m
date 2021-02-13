From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 22:46:27 +0100
Subject: [Buildroot] [git commit] support/testing: TestATFAllwinner needs
 python3 for u-boot
Message-ID: <20210213212519.7739A8396C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=653b127d1edec5bf267225aa653ff296725a76ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New U-Boot version needs Python 3.x for pylibfdt.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385909

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
