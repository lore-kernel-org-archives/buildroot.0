From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 13:44:21 +0200
Subject: [Buildroot] [git commit] board/qemu: remove the Qemu version from
 readme.txt
Message-ID: <20200426113131.3AF648156D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dcb9e98b5ec52142436d16d70b0f6aff7b0e1ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qemu version present in readme.txt files was needed when
the Buildroot's Qemu defconfig was tested manually using the
qemu-system-<arch> binary already present on the host.

This information is now incorrect since we are using host-qemu
package, currently at 4.2.0 version, to do a runtime test since
0c7935063851accf3db4c9eb2fc4f11c3da0c391.

For m68k-q800, we can use the upstream qemu since 4.2.0 release
[1].

So, remove this line from the readme.txt.

[1] https://www.qemu.org/2019/12/13/qemu-4-2-0/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/aarch64-virt/readme.txt     | 2 --
 board/qemu/arm-versatile/readme.txt    | 2 --
 board/qemu/arm-vexpress-tz/readme.txt  | 2 --
 board/qemu/arm-vexpress/readme.txt     | 2 --
 board/qemu/m68k-mcf5208/readme.txt     | 2 --
 board/qemu/m68k-q800/readme.txt        | 3 ---
 board/qemu/microblazebe-mmu/readme.txt | 2 --
 board/qemu/microblazeel-mmu/readme.txt | 2 --
 board/qemu/mips32r2-malta/readme.txt   | 2 --
 board/qemu/mips32r2el-malta/readme.txt | 2 --
 board/qemu/mips32r6-malta/readme.txt   | 2 --
 board/qemu/mips32r6el-malta/readme.txt | 2 --
 board/qemu/mips64-malta/readme.txt     | 2 --
 board/qemu/mips64el-malta/readme.txt   | 2 --
 board/qemu/mips64r6-malta/readme.txt   | 2 --
 board/qemu/mips64r6el-malta/readme.txt | 2 --
 board/qemu/nios2-10m50/readme.txt      | 2 --
 board/qemu/or1k/readme.txt             | 2 --
 board/qemu/ppc-g3beige/readme.txt      | 2 --
 board/qemu/ppc-mac99/readme.txt        | 2 --
 board/qemu/ppc-mpc8544ds/readme.txt    | 2 --
 board/qemu/ppc-virtex-ml507/readme.txt | 2 --
 board/qemu/ppc64-e5500/readme.txt      | 2 --
 board/qemu/ppc64-pseries/readme.txt    | 2 --
 board/qemu/ppc64le-pseries/readme.txt  | 2 --
 board/qemu/riscv32-virt/readme.txt     | 2 --
 board/qemu/riscv64-virt/readme.txt     | 2 --
 board/qemu/sh4-r2d/readme.txt          | 2 --
 board/qemu/sh4eb-r2d/readme.txt        | 2 --
 board/qemu/sparc-ss10/readme.txt       | 2 --
 board/qemu/sparc64-sun4u/readme.txt    | 2 --
 board/qemu/x86/readme.txt              | 2 --
 board/qemu/x86_64/readme.txt           | 2 --
 board/qemu/xtensa-lx60/readme.txt      | 2 --
 34 files changed, 69 deletions(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index f12bed4e06..db35a3a7a8 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
   qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 97331b2f03..223bd55c01 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -8,5 +8,3 @@ Or for the noMMU emulation:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 35ff018aec..b235ba5cd7 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -29,8 +29,6 @@ number of cores.
 Note: "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
 brings network support that is used i.e. in OP-TEE regression tests.
 
-Tested with QEMU 2.12.0, and 3.1.0.
-
 
 -- Boot Details --
 
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index ff7790744f..8d1bb72f83 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -7,5 +7,3 @@ graphical window is the framebuffer.
 
 If you want to emulate more cores change "-smp 1" to "-smp 2" for
 dual-core or even "smp -4" for a quad-core configuration.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
index 76dce0ab94..79bf7146a2 100644
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic # qemu_m68k_mcf5208_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-q800/readme.txt b/board/qemu/m68k-q800/readme.txt
index 4ed328507a..f1db57d52b 100644
--- a/board/qemu/m68k-q800/readme.txt
+++ b/board/qemu/m68k-q800/readme.txt
@@ -3,6 +3,3 @@ Run the emulation with:
  qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0" # qemu_m68k_q800_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.11.0 from https://github.com/vivier/qemu-m68k
-You need following branch: q800-v2.11.0
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 3d5064cbd3..7bb986422c 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazebe_mmu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index c9f94f8de5..20fa0072ed 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index 0fb8e47999..db1db65b1e 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 1613757657..4dc0e64e02 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 21854a7f90..9ad4959f09 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips32r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index d1bd3de7fa..96c9dc88bf 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic # qemu_mips32r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 6a411d23d2..7432dac1a1 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -4,5 +4,3 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index d7dea160ff..f67ac91ac4 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -4,5 +4,3 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index a5637b763c..252a543192 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index 48ed0ff6fb..e9d02e772a 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
index d240891873..f8f8f3b3a5 100644
--- a/board/qemu/nios2-10m50/readme.txt
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
   qemu-system-nios2 -kernel output/images/vmlinux -nographic # qemu_nios2_10m50_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0.
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index 72c9e3c3cf..2ea797440a 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 
 Ethernet support is not working, yet.
-
-Tested with QEMU 2.12.0.
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 40021f0a17..e6c9c2016e 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -4,5 +4,3 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-mac99/readme.txt b/board/qemu/ppc-mac99/readme.txt
index f1b722bdb8..fb94a7837d 100644
--- a/board/qemu/ppc-mac99/readme.txt
+++ b/board/qemu/ppc-mac99/readme.txt
@@ -1,5 +1,3 @@
 Run the emulation with:
 
   qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda" # qemu_ppc_mac99_defconfig
-
-Tested with QEMU 3.1.0
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index 32be8a9290..d34d64c336 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user # qemu_ppc_mpc8544ds_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index 567ba7e6a7..feb4b2d7d6 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb # qemu_ppc_virtex_ml507_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index 74b7c32820..61d51f7f4d 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc64_e5500_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index cf82edacc5..cbd3c6ca2b 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64_pseries_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 00a38e9fc1..8ee72ea6cf 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
 qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses # qemu_ppc64le_pseries_defconfig
 
 The login prompt will appear in the terminal window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 98028a980f..6a848270bd 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -3,5 +3,3 @@ Run Linux in emulation with:
   qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 3.1
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 4b05784549..81b5246e66 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -3,5 +3,3 @@ Run Linux in emulation with:
   qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 3.1
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index f5364fdfec..b0799e47a8 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -4,5 +4,3 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index 8a3373481a..9f3dd8b20b 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -4,5 +4,3 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index e317ccdae5..d624b82d9f 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
   qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user # qemu_sparc_ss10_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index 439ecbf312..17d8cbdf9b 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
   qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=output/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user # qemu_sparc64_sun4u_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 951bf11a68..a1f232e2e4 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 8b8efa7e8c..2b2ae3be20 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 54355564d4..6f0e2710c0 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -5,5 +5,3 @@ Run the emulation with:
  qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf # qemu_xtensa_lx60_nommu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
