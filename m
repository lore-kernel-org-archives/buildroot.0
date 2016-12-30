From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 30 Dec 2016 20:17:16 -0200
Subject: [Buildroot] [PATCH 2/2] configs/warpboard: Select
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
In-Reply-To: <1483136236-4975-1-git-send-email-festevam@gmail.com>
References: <1483136236-4975-1-git-send-email-festevam@gmail.com>
Message-ID: <1483136236-4975-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the Broadcom wireless driver
to be automatically loaded on boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.7.4
