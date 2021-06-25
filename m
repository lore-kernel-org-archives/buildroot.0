From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 25 Jun 2021 22:33:15 +0300
Subject: [Buildroot] [PATCH v3 2/5] support/testing: switch TestATFAllwinner
 to mainline TF-A
In-Reply-To: <20210625193318.635449-1-geomatsi@gmail.com>
References: <20210625193318.635449-1-geomatsi@gmail.com>
Message-ID: <20210625193318.635449-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to mainline TF-A that provides basic support for H5 and A64.
Note that Allwinner platform layer in TF-A does not provide support
for GCC stack protection, so make sure to disable this TF-A feature.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 support/testing/tests/boot/test_atf.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index e6c11aa742..8c29fbd594 100644
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
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_NONE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.32.0
