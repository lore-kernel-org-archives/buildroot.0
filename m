From: David Lechner <david@lechnology.com>
Date: Sun, 30 Oct 2016 18:32:23 -0500
Subject: [Buildroot] [PATCH 1/4] configs/lego_ev3: add U-Boot support
In-Reply-To: <1477870346-4941-1-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
Message-ID: <1477870346-4941-2-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds U-Boot configuration for LEGO MINDSTORMS EV3. U-Boot has
had support for LEGO MINDSTORMS EV3 since v2016.05.

Signed-off-by: David Lechner <david@lechnology.com>
---
 configs/lego_ev3_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 1ddc4f9..bf425f1 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -24,3 +24,8 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
-- 
2.7.4
