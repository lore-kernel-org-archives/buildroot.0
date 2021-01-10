From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 10 Jan 2021 17:16:28 +0300
Subject: [Buildroot] [PATCH 3/4] support/testing: fix TestATFAllwinner test
In-Reply-To: <20210110141629.1510597-1-geomatsi@gmail.com>
References: <20210110141629.1510597-1-geomatsi@gmail.com>
Message-ID: <20210110141629.1510597-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix U-Boot config snippet in TestATFAllwinner. Bump U-Boot
version to fix DTC build on hosts with gcc 10 and add
pylibfdt dependency.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 support/testing/tests/boot/test_atf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index e637673f04..c23b9d8aba 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -41,9 +41,10 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
+        BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
         BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
         BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-- 
2.30.0
