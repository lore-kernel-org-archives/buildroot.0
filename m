From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:17:58 +0100
Subject: [Buildroot] [git commit] fs/iso9660: select ISO9660 support in Grub
Message-ID: <20131229111948.81AD99C20D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=418c3a2f90e409a7707b825d26d4bfaeb2913f3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fs/iso9660 logic assumes that the Grub bootloader is
used. Therefore, it should make sure that Grub is configured with the
support for the ISO9660 filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
