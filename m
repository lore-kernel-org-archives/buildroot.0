From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 22 Dec 2020 18:27:43 +0100
Subject: [Buildroot] [PATCH] configs/nitrogen6x_defconfig: remove duplicate
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
Message-ID: <20201222172743.2725308-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit [1] added this option a second time.
Remove the first occurence.

Fixes:
configs/nitrogen6x_defconfig:31:warning: override: reassigning to symbol BR2_PACKAGE_HOST_UBOOT_TOOLS

[1] 6ea9f662a03e0f4b4a9000a25095b8e6293b07b6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 configs/nitrogen6x_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 5353b38fd5..13c14e6d2a 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -11,7 +11,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.25.4
