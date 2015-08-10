From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 10 Aug 2015 16:05:06 -0400
Subject: [Buildroot] [PATCH] fs: cpio: uImage depends on U-Boot
Message-ID: <1439237106-18033-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though some bootloaders such as Barebox can boot uImage, this
format is quite U-Boot specific. So make BR2_TARGET_ROOTFS_CPIO_UIMAGE
depends on BR2_TARGET_UBOOT.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 fs/cpio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 206baca..97750e2 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -50,6 +50,7 @@ endchoice
 
 config BR2_TARGET_ROOTFS_CPIO_UIMAGE
 	bool "Create U-Boot image of the root filesystem"
+	depends on BR2_TARGET_UBOOT
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS
 	help
 	  Add a U-Boot header to the cpio root filesystem. This allows
-- 
2.5.0
