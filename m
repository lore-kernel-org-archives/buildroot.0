From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Nov 2016 23:21:06 +0100
Subject: [Buildroot] [PATCH 2/4] fs/iso9660: use pseudo instead of fakeroot
In-Reply-To: <cover.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <30f63b816aaf5e8bf4764f1debcf7fae2d654f43.1478211656.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're dropping fakeroot in favour of pseudo, now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 32d79d7..c9af4bd 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -24,7 +24,7 @@
 
 ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux
+ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-pseudo linux
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 ROOTFS_ISO9660_USE_INITRD = YES
-- 
2.7.4
