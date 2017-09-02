From: Nicholas Sielicki <sielicki@yandex.com>
Date: Sat,  2 Sep 2017 02:20:01 -0500
Subject: [Buildroot] [PATCH 1/1] configs: more grub2 WCHAR fixes
Message-ID: <20170902072001.685-1-sielicki@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 5ffafd2353f5d67 (grub2: bump up version), grub2 needs a
toolchain with WCHAR support. Add BR2_TOOLCHAIN_BUILDROOT_WCHAR=y to all
configs with BR2_TARGET_GRUB2=y

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
---
 configs/galileo_defconfig                   | 2 ++
 configs/minnowboard_max-graphical_defconfig | 2 ++
 configs/minnowboard_max_defconfig           | 2 +-
 configs/pc_x86_64_bios_defconfig            | 2 +-
 configs/pc_x86_64_efi_defconfig             | 2 +-
 5 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 43639a41a..39622e331 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,4 +1,6 @@
 BR2_x86_x1000=y
+# Needed for TARGET_GRUB2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index ef0947cb7..2c11fb378 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -6,6 +6,8 @@ BR2_x86_atom=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+# needed for TARGET_GRUB2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System configuration
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index db6e59577..c32e5b460 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
 # Linux headers same as kernel, a 4.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
-# Needed for grub2
+# Needed for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 7e852f365..22032294b 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_x86_64=y
 
-# Toolchain, required for eudev (to autoload drivers)
+# Toolchain, required for eudev (to autoload drivers) and for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index f558c3e8c..a347555d1 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_x86_64=y
 
-# Toolchain, required for eudev (to autoload drivers)
+# Toolchain, required for eudev (to autoload drivers) and for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
-- 
2.14.1
