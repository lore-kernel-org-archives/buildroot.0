From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  9 Jun 2021 22:59:37 +0300
Subject: [Buildroot] [PATCH v2 02/28] support/testing: switch
 TestATFAllwinner to mainline ATF
In-Reply-To: <20210609200003.2866122-1-geomatsi@gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
Message-ID: <20210609200003.2866122-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to mainline ATF that provides basic support for H5 and A64.
Note that allwinner platform layer does not provide support for
GCC stack protection, so make sure to disable this ATF feature.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 support/testing/tests/boot/test_atf.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index e6c11aa742..868b13c9e6 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -33,10 +33,11 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.31.1
