From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:21:53 +0100
Subject: [Buildroot] [git commit] configs/warp7: Select
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
Message-ID: <20161228222502.3C35881E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf82c1866b5aa231fea8b402cadee79dd7116e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the Broadcom wireless driver
to be automatically loaded on boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warp7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index ca7cd00..2d59626 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -31,6 +31,9 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
 
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
 # wireless packages
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
