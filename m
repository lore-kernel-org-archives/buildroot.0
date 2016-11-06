From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Nov 2016 00:14:08 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_mali: bump kernel
Message-ID: <1478474048-19255-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

compat with gcc 5

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index b2d7dd5..35af5f9 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -17,8 +17,10 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot-mali.cmd $(TARGET_D
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
+# based on Linux version 3.4.113
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dbabbacbbf8984dea0a8c893b38b376a6ecbb3c1"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.7.4
