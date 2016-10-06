From: Dagg Stompler <daggs@gmx.com>
Date: Thu,  6 Oct 2016 14:14:59 +0300
Subject: [Buildroot] [PATCH] config/odroidc2: force usage of gcc 4.9.x
Message-ID: <20161006111459.25547-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

due to an issue with odroid's u-boot, compiling u-boot with
gcc 5.x will result in a non booting image.
so a gcc 4.9.x compiler must be used.
this solve bug #9326

thanks to Erico Nunes <nunes.erico@gmail.com> for pointing
to the right issue.

Reported-by: <gahabana@mail.com>
Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 45ede62..0c8ff3d 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -7,6 +7,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
 BR2_PACKAGE_ODROID_SCRIPTS=y
+BR2_GCC_VERSION_4_9_X=y
 
 # Kernel
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.10.1
