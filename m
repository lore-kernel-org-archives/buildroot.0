From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  9 Feb 2020 19:03:23 +0100
Subject: [Buildroot] [PATCH v4 5/9] board/qemu: add defconfig file name as
 tag before the qemu command line
In-Reply-To: <20200209180327.455426-1-romain.naour@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
Message-ID: <20200209180327.455426-6-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add the name of the Qemu defconfig file before each
qemu command line in order to retrieve it easily.

Since a readme.txt can be shared between several Qemu defconfig, we
need at least one qemu command line in readme.txt for each defconfig.

[1] http://lists.busybox.net/pipermail/buildroot/2020-February/273189.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/aarch64-virt/readme.txt     |  2 +-
 board/qemu/arm-versatile/readme.txt    |  4 ++--
 board/qemu/arm-vexpress-tz/readme.txt  |  2 +-
 board/qemu/arm-vexpress/readme.txt     |  2 +-
 board/qemu/csky/readme.txt             | 11 +++++++----
 board/qemu/m68k-mcf5208/readme.txt     |  2 +-
 board/qemu/m68k-q800/readme.txt        |  2 +-
 board/qemu/microblazebe-mmu/readme.txt |  2 +-
 board/qemu/microblazeel-mmu/readme.txt |  2 +-
 board/qemu/mips32r2-malta/readme.txt   |  2 +-
 board/qemu/mips32r2el-malta/readme.txt |  2 +-
 board/qemu/mips32r6-malta/readme.txt   |  2 +-
 board/qemu/mips32r6el-malta/readme.txt |  2 +-
 board/qemu/mips64-malta/readme.txt     |  2 +-
 board/qemu/mips64el-malta/readme.txt   |  2 +-
 board/qemu/mips64r6-malta/readme.txt   |  2 +-
 board/qemu/mips64r6el-malta/readme.txt |  2 +-
 board/qemu/nios2-10m50/readme.txt      |  2 +-
 board/qemu/or1k/readme.txt             |  2 +-
 board/qemu/ppc-g3beige/readme.txt      |  2 +-
 board/qemu/ppc-mac99/readme.txt        |  2 +-
 board/qemu/ppc-mpc8544ds/readme.txt    |  2 +-
 board/qemu/ppc-virtex-ml507/readme.txt |  2 +-
 board/qemu/ppc64-e5500/readme.txt      |  2 +-
 board/qemu/ppc64-pseries/readme.txt    |  2 +-
 board/qemu/ppc64le-pseries/readme.txt  |  2 +-
 board/qemu/riscv32-virt/readme.txt     |  2 +-
 board/qemu/riscv64-virt/readme.txt     |  2 +-
 board/qemu/sh4-r2d/readme.txt          |  2 +-
 board/qemu/sh4eb-r2d/readme.txt        |  2 +-
 board/qemu/sparc-ss10/readme.txt       |  2 +-
 board/qemu/sparc64-sun4u/readme.txt    |  2 +-
 board/qemu/x86/readme.txt              |  2 +-
 board/qemu/x86_64/readme.txt           |  2 +-
 board/qemu/xtensa-lx60/readme.txt      |  4 +++-
 35 files changed, 44 insertions(+), 39 deletions(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index f868905d91..3443de05a8 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
+qemu_aarch64_virt_defconfig: qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index f3a9e1ab47..cdc08acf5a 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -1,10 +1,10 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
+qemu_arm_versatile_defconfig: qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
 
 Or for the noMMU emulation:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
+qemu_arm_versatile_nommu_defconfig: qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 35ff018aec..64127f4dd1 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -12,7 +12,7 @@ QEMU platform is quite specific for that in TF-A and one needs to
 run the emulation from the image directory for TF-A to boot the
 secure and non-secure worlds.
 
-  cd output/images && ../host/bin/qemu-system-arm \
+qemu_arm_vexpress_tz_defconfig: qemu-system-arm \
 	-machine virt -machine secure=on -cpu cortex-a15 \
 	-smp 1 -s -m 1024 -d unimp \
 	-serial stdio \
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 7f7b43a3b3..16f9baf7c9 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 rootwait root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
+qemu_arm_vexpress_defconfig: qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 rootwait root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
index 89d68aafb8..c92960299d 100644
--- a/board/qemu/csky/readme.txt
+++ b/board/qemu/csky/readme.txt
@@ -1,12 +1,15 @@
 Run with qemu:
 
 For ck860 smp:
- qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
+qemu_csky860_virt_defconfig: qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
 
-For ck810/ck807:
- qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+For ck807:
+qemu_csky807_virt_defconfig: qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+For ck810:
+qemu_csky810_virt_defconfig: qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
 
 For ck610:
- qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
+qemu_csky610_virt_defconfig: qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
 
 The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
index d1c9086805..514e537806 100644
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic
+qemu_m68k_mcf5208_defconfig: qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/m68k-q800/readme.txt b/board/qemu/m68k-q800/readme.txt
index b516bacdff..12696562a7 100644
--- a/board/qemu/m68k-q800/readme.txt
+++ b/board/qemu/m68k-q800/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0"
+qemu_m68k_q800_defconfig: qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0"
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 4f52baff1f..cd0221924f 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
+qemu_microblazebe_mmu_defconfig: qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 0b0f330a5e..346da3caa6 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
+qemu_microblazeel_mmu_defconfig: qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index 9ff3c4b810..fdab1d5244 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
+qemu_mips32r2_malta_defconfig: qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 745bfea608..1609fc7427 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
+qemu_mips32r2el_malta_defconfig: qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 6a026b2165..3f7e4f5e66 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+qemu_mips32r6_malta_defconfig: qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index f69fd21af1..6212e5e0ca 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic
+qemu_mips32r6el_malta_defconfig: qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index ea3a92541e..d7ee4ec660 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
+qemu_mips64_malta_defconfig: qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 144da93839..65ad238b2d 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
+qemu_mips64el_malta_defconfig: qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index cfa16fd863..42fe49d7ef 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+qemu_mips64r6_malta_defconfig: qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index 61a6ceb5f4..bf4b839d52 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+qemu_mips64r6el_malta_defconfig: qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
index 44cbcb08a2..067f604d6c 100644
--- a/board/qemu/nios2-10m50/readme.txt
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-nios2 -kernel output/images/vmlinux -nographic
+qemu_nios2_10m50_defconfig: qemu-system-nios2 -kernel output/images/vmlinux -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index df6b467e82..3ffd1069ea 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-or1k -kernel output/images/vmlinux -nographic
+qemu_or1k_defconfig: qemu-system-or1k -kernel output/images/vmlinux -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 608814ee3b..206db3544d 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
+qemu_ppc_g3beige_defconfig: qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/ppc-mac99/readme.txt b/board/qemu/ppc-mac99/readme.txt
index a8a18db5b9..1e2976f7c9 100644
--- a/board/qemu/ppc-mac99/readme.txt
+++ b/board/qemu/ppc-mac99/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-  qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"
+qemu_ppc_mac99_defconfig: qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"
 
 Tested with QEMU 3.1.0
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index 172aad5626..dd24aa2445 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user
+qemu_ppc_mpc8544ds_defconfig: qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index 6178ace816..0cc458872d 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb
+qemu_ppc_virtex_ml507_defconfig: qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index 8080766984..072ee098f9 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic
+qemu_ppc64_e5500_defconfig: qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 6a3e96a2e5..a75d883cc6 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
+qemu_ppc64_pseries_defconfig: qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 2728675df2..8e0fc4a94f 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
+qemu_ppc64le_pseries_defconfig: qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
 
 The login prompt will appear in the terminal window.
 
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 5d7c1988d2..18803023f7 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,6 +1,6 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+qemu_riscv32_virt_defconfig: qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index c075cc464d..41154da7c6 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+qemu_riscv64_virt_defconfig: qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index dd80953b97..86778a7e0b 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
+qemu_sh4_r2d_defconfig: qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index e71a9bce90..4ee690e9cc 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
+qemu_sh4eb_r2d_defconfig: qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 33833c2d33..a79f0935a7 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
+qemu_sparc_ss10_defconfig: qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index f2e6e81a86..7d35e1a74c 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=output/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user
+qemu_sparc64_sun4u_defconfig: qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=output/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 3bbafecf91..79ed04b287 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
+qemu_x86_defconfig: qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 93ac22a947..e5031106df 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
+qemu_x86_64_defconfig: qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 4287e1f09e..9a7f45e5ad 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -1,6 +1,8 @@
 Run the emulation with:
 
- qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf
+qemu_xtensa_lx60_defconfig: qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf
+
+qemu_xtensa_lx60_nommu_defconfig: qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf
 
 The login prompt will appear in the terminal that started Qemu.
 
-- 
2.24.1
