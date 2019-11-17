From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:01 +0100
Subject: [Buildroot] [PATCH v3 for-next 03/11] board/qemu/arm-versatile:
 move arm-versatile nommu stuff to board/qemu/arm-versatile-nommu
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to indroduce automated gitlab testing for all qemu defconfig,
split arm-versatile (MMU) and arm-versatile (noMMU) to a separate
directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../linux-nommu.config => arm-versatile-nommu/linux.config}   | 0
 .../patches/linux/versatile-nommu.patch                       | 0
 board/qemu/{arm-versatile => arm-versatile-nommu}/readme.txt  | 4 ----
 board/qemu/arm-versatile/readme.txt                           | 4 ----
 configs/qemu_arm_versatile_nommu_defconfig                    | 4 ++--
 5 files changed, 2 insertions(+), 10 deletions(-)
 rename board/qemu/{arm-versatile/linux-nommu.config => arm-versatile-nommu/linux.config} (100%)
 rename board/qemu/{arm-versatile => arm-versatile-nommu}/patches/linux/versatile-nommu.patch (100%)
 copy board/qemu/{arm-versatile => arm-versatile-nommu}/readme.txt (53%)

diff --git a/board/qemu/arm-versatile/linux-nommu.config b/board/qemu/arm-versatile-nommu/linux.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-nommu.config
rename to board/qemu/arm-versatile-nommu/linux.config
diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile-nommu/patches/linux/versatile-nommu.patch
similarity index 100%
rename from board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
rename to board/qemu/arm-versatile-nommu/patches/linux/versatile-nommu.patch
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile-nommu/readme.txt
similarity index 53%
copy from board/qemu/arm-versatile/readme.txt
copy to board/qemu/arm-versatile-nommu/readme.txt
index f3a9e1ab47..d25cc4dc00 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile-nommu/readme.txt
@@ -1,9 +1,5 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
-
-Or for the noMMU emulation:
-
   qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
 
 The login prompt will appear in the terminal that started Qemu. The
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index f3a9e1ab47..e514cefe82 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -2,10 +2,6 @@ Run the emulation with:
 
   qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
 
-Or for the noMMU emulation:
-
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
-
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index ae4353d0a5..c4fefeef48 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -7,7 +7,7 @@ BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/arm-versatile/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/arm-versatile-nommu/patches"
 
 # Busybox with hush
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
@@ -29,7 +29,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile-nommu/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
 
-- 
2.21.0
