From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:18:12 +0200
Subject: [Buildroot] [git commit] fs/iso9660: use if ... endif block instead
	of depends on
Message-ID: <20150614212541.D1BD47FFFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48229662ce5f01e0765823eca5b53db106ace41a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the addition of numerous additional options to the
iso9660 filesystem logic, use a if ... endif block instead of a
depends on for the only option that currently exists.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
