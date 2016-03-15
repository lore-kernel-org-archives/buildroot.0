From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:39:55 +0100
Subject: [Buildroot] [PATCH 2/3] configs: pandaboard: configure eth0 at
	startup
In-Reply-To: <1458077996-15549-1-git-send-email-peter@korsgaard.com>
References: <1458077996-15549-1-git-send-email-peter@korsgaard.com>
Message-ID: <1458077996-15549-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have modules (including usb/net) loaded automatically, we can
enable dhcp on eth0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pandaboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 3a6e383..3727e3d 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.7.0
