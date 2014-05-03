From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 May 2014 17:20:14 -0300
Subject: [Buildroot] [PATCH 2/3] configs/qemu: update for host-qemu-system
In-Reply-To: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399148415-27648-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the invocation parameter for use with host-qemu-system.
Narrow down the Qemu version like it's done for kernel headers since we
can't guarantee that a host-qemu-system version bump won't break the
configs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_nuri_defconfig         | 5 +++++
 configs/qemu_arm_versatile_defconfig    | 5 +++++
 configs/qemu_arm_vexpress_defconfig     | 5 +++++
 configs/qemu_microblazebe_mmu_defconfig | 5 +++++
 configs/qemu_microblazeel_mmu_defconfig | 5 +++++
 configs/qemu_mips64_malta_defconfig     | 5 +++++
 configs/qemu_mips64el_malta_defconfig   | 5 +++++
 configs/qemu_mips_malta_defconfig       | 5 +++++
 configs/qemu_mipsel_malta_defconfig     | 5 +++++
 configs/qemu_ppc_g3beige_defconfig      | 5 +++++
 configs/qemu_ppc_mpc8544ds_defconfig    | 5 +++++
 configs/qemu_ppc_virtex_ml507_defconfig | 5 +++++
 configs/qemu_sh4_r2d_defconfig          | 5 +++++
 configs/qemu_sparc_ss10_defconfig       | 5 +++++
 configs/qemu_x86_64_defconfig           | 5 +++++
 configs/qemu_x86_defconfig              | 5 +++++
 16 files changed, 80 insertions(+)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 40dcb37..0222459 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -25,3 +25,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.32"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu-system
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M nuri -kernel output/images/zImage -append 'console=ttySAC1,115200' -smp 2 -serial null -serial stdio -display curses"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1348bab..0accccd 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.13.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu-system
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append 'root=/dev/sda console=ttyAMA0,115200' -serial stdio -net nic,model=smc91c111 -net user -display none"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index e35a44a..facb3f6 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -24,3 +24,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=sd -append 'console=ttyAMA0,115200 root=/dev/mmcblk0' -serial stdio -net nic,model=lan9118 -net user -display none"
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index b3ec32f..0698178 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -17,3 +17,8 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.14.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio -display none"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index a009893..a0383e5 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -17,3 +17,8 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.14.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio -display none"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 97937d1..6759a0d 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -display none"
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 4adf204..e3497de 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -25,3 +25,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -display none"
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 3c1532c..b788312 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -net nic,model=pcnet -net user -display none"
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index b673f0b..8642de8 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append 'root=/dev/hda' -net nic,model=pcnet -net user -display none"
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 1668e72..ef2cf49 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append 'console=ttyS0 root=/dev/hda' -serial stdio -net nic,model=rtl8139 -net user -display none"
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 6d7f24d..18b7862 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -21,3 +21,8 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user -display none"
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index cd2f647..f5f1d04 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -22,3 +22,8 @@ BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M virtex-ml507 -kernel output/images/vmlinux -m 256 -append 'console=ttyS0' -display none -nographic -dtb output/images/virtex440-ml507.dtb"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index b27d9ec..fd70d69 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -26,3 +26,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.55"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda console=ttySC1,115200 noiotrap' -serial null -serial stdio -net nic,model=rtl8139 -net user -display none"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 3b56d98..15893bd 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -17,3 +17,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append 'root=/dev/sda console=ttyS0,115200' -serial stdio -net nic,model=lance -net user -display none"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 827d362..95e6a00 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -20,3 +20,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda' -net nic,model=rtl8139 -net user -display curses"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index a5040c8..3fa1432 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -21,3 +21,8 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.13.config"
+
+# Qemu
+BR2_PACKAGE_HOST_QEMU_SYSTEM=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.0.0"
+BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append 'root=/dev/sda' -net nic,model=rtl8139 -net user -display curses"
-- 
1.8.3.2
