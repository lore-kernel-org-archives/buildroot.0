From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 13:50:46 +0200
Subject: [Buildroot] [git commit] qemu/microblazeel-mmu: update configuration
Message-ID: <20120509115157.04A7D96C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b184e46dd3a302c4517c781d90da6405576edf6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beautify and lock down kernel version to avoid future issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_microblazeel_mmu_defconfig |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 61420b4..26897b7 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -1,15 +1,25 @@
+# Architecture
 BR2_microblaze=y
 BR2_microblazeel=y
+
+# Toolchain
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
+
+# System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
+
+# Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.3.config"
 BR2_LINUX_KERNEL_DTS_FILE="board/qemu/microblazeel-mmu/system.dts"
