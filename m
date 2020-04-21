From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:45 +0200
Subject: [Buildroot] [PATCHv2 11/12] configs/qemu_riscv*: remove
 BR2_TARGET_OPENSBI_USE_PLAT
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-11-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option never existed in opensbi package.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 configs/qemu_riscv32_virt_defconfig | 1 -
 configs/qemu_riscv64_virt_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 427ea47387..f47700f4ab 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -27,7 +27,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 2125324aff..659a6046ed 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -26,7 +26,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_USE_PLAT=y
 BR2_TARGET_OPENSBI_PLAT="qemu/virt"
 
 # host-qemu for gitlab testing
-- 
2.25.3
