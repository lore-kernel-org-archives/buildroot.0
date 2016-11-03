From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:28:01 +0100
Subject: [Buildroot] [git commit] fs/iso9660: drop reference to host-fakeroot
Message-ID: <20161103223211.2F2227FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ed7fcad1da81894a32ec2908f56b001feefb6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 41f0688d9113dd33a5971c5654c7efd022727ed2 ("fs/iso9660:
convert to the filesystem infrastructure"), the is9660 logic uses the
common filesystem infrastructure, so the dependency on host-fakeroot is
no longer needed, and has actually become bogus since we switched to
host-pseudo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 32d79d7..d1d9cbf 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -24,7 +24,7 @@
 
 ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux
+ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit linux
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 ROOTFS_ISO9660_USE_INITRD = YES
