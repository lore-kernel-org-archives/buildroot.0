From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:56:35 +0100
Subject: [Buildroot] [PATCH 4/9] fs/iso9660: select ISO9660 support in Grub
In-Reply-To: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388242600-2580-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fs/iso9660 logic assumes that the Grub bootloader is
used. Therefore, it should make sure that Grub is configured with the
support for the ISO9660 filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 4c200c8..50b4377 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -4,6 +4,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_CPIO
 	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
-- 
1.8.3.2
