From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:55:13 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] configs/qemu_riscv*:
 remove BR2_TARGET_OPENSBI_USE_PLAT
Message-ID: <20200507214107.C9C7B8FEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0749eaf94dd95511213798b5a5793d4204495b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This option never existed in opensbi package.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8dd067ef3ae92eda4d883dd002c4b48b60dd4e8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv32_virt_defconfig | 1 -
 configs/qemu_riscv64_virt_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 914eada004..242cc69e56 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -23,7 +23,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 5c52f7a0f8..10d7899480 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -22,7 +22,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
