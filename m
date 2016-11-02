From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:28:35 +0100
Subject: [Buildroot] [git commit] configs/lego_ev3: add U-Boot support
Message-ID: <20161102163102.2C41A818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=671e1ee907f7930c44e3396abb741d1f385f1664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds U-Boot configuration for LEGO MINDSTORMS EV3. U-Boot has
had support for LEGO MINDSTORMS EV3 since v2016.05.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/lego_ev3_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 1ddc4f9..1521fa7 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -24,3 +24,10 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
