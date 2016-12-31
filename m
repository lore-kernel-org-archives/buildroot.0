From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Dec 2016 09:18:25 +0100
Subject: [Buildroot] [git commit] configs/warpboard: Select
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
Message-ID: <20161231081908.52C9E80008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9baa390f83131e682e7b470875781df9c5c00e92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the Broadcom wireless driver
to be automatically loaded on boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warpboard_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 5b0ed2c..1655381 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -28,6 +28,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
 # wireless packages
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
