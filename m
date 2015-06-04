From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:21 +0200
Subject: [Buildroot] [PATCH 03/12] fs/iso9660: use if ... endif block
	instead of depends on
In-Reply-To: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433430330-2166-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation to the addition of numerous additional options to the
iso9660 filesystem logic, use a if ... endif block instead of a
depends on for the only option that currently exists.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 50b4377..9d00ab8 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -8,11 +8,14 @@ config BR2_TARGET_ROOTFS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
+if BR2_TARGET_ROOTFS_ISO9660
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
-	depends on BR2_TARGET_ROOTFS_ISO9660
 	default "fs/iso9660/menu.lst"
 
+endif
+
 comment "iso image needs a Linux kernel to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL
-- 
2.1.0
