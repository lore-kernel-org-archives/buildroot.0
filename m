From: Dagg Stompler <daggs@gmx.com>
Date: Fri,  2 Dec 2016 12:10:28 +0200
Subject: [Buildroot] [PATCH 2/2] odroidc2: use first boot fs resize pkg.
In-Reply-To: <20161202101028.26736-1-daggs@gmx.com>
References: <20161202101028.26736-1-daggs@gmx.com>
Message-ID: <20161202101028.26736-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove the hardcode limitation of the created rootfs parition size and
use the newly added first boot fs resize pkg to extend the fs to the max
possible.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/genimage.cfg | 1 -
 configs/odroidc2_defconfig             | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index 15f97d445..16d2786b1 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -22,6 +22,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 95a916944..6e006a9dc 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -7,6 +7,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
 BR2_PACKAGE_ODROID_SCRIPTS=y
+BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER=y
+BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER_SYSV_PRIORITY=3
 BR2_GCC_VERSION_4_9_X=y
 
 # Kernel
-- 
2.11.0
