From: David Lechner <david@lechnology.com>
Date: Fri, 22 Feb 2019 19:04:54 -0600
Subject: [Buildroot] [PATCH 2/2] configs/lego_ev3_defconfig: enable brickd
 by default
In-Reply-To: <20190223010454.7335-1-david@lechnology.com>
References: <20190223010454.7335-1-david@lechnology.com>
Message-ID: <20190223010454.7335-2-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables the brickd package by default on LEGO MINDSTORM EV3. This
program is important because it shuts down the system on low battery.
Without this, rechargeable batteries could be damaged.

Signed-off-by: David Lechner <david@lechnology.com>
---
 configs/lego_ev3_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index cf2809059e..b4a1000036 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -8,6 +8,7 @@ BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
@@ -27,6 +28,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="da850-lego-ev3"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/lego/ev3/busybox.fragment"
 BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_BRICKD=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560=y
 
-- 
2.17.1
