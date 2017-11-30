From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:37:41 +0100
Subject: [Buildroot] [git commit branch/next] qemu-or1k: update to 4.14.x
Message-ID: <20171130103101.24F367FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=913c822e01d184c6a867cb68c7fda8de8724aac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Or1k support improved, f.e. musl can be tested inside qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/or1k/{linux-4.11.config => linux.config} | 0
 configs/qemu_or1k_defconfig                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/or1k/linux-4.11.config b/board/qemu/or1k/linux.config
similarity index 100%
rename from board/qemu/or1k/linux-4.11.config
rename to board/qemu/or1k/linux.config
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 0eb1916..c667142 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -5,12 +5,12 @@ BR2_or1k=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4,14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
