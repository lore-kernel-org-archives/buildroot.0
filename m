From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 23:21:27 +0200
Subject: [Buildroot] [git commit] configs/qemu_riscv{32,
 64}_virt: remove BR2_TARGET_GENERIC_GETTY_PORT
Message-ID: <20200421210701.DF4348FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fdfe5930ffe12f531153502a280c4aab7ce67d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Giving an explicit getty port is not really needed, as we already
spawn a getty on the "console" device, which will match the serial
port passed as console= argument on the kernel command line.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_riscv32_virt_defconfig | 1 -
 configs/qemu_riscv64_virt_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index f47700f4ab..dc1a5b1295 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -5,7 +5,6 @@ BR2_RISCV_32=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
 
 # Filesystem
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 659a6046ed..a376b7dec2 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -5,7 +5,6 @@ BR2_RISCV_64=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
