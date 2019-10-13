From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:27 -0300
Subject: [Buildroot] [PATCH 4/9] configs/minnowboard_max-graphical: don't
 use custom post-image script
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-5-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
The defconfig was edited by hand to reduce the turmoild that would
result from using "make savedefconfig"
---
 configs/minnowboard_max-graphical_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 1d043240ad..910c324e25 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -13,7 +13,8 @@ BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/minnowboard/fs-overlay-graphical"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 
 # Host packages
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.18.1
