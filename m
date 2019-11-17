From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:19:06 +0100
Subject: [Buildroot] [PATCH v3 for-next 08/11] board/qemu/*/launch.sh: add
 qemu launch script
In-Reply-To: <20191117201909.12900-1-romain.naour@smile.fr>
References: <20191117201909.12900-1-romain.naour@smile.fr>
Message-ID: <20191117201909.12900-9-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

It is not very convenient for Buildroot users to store
the Qemu command line in a readme.txt instead of a script
to be used as soon as the Qemu image has been created.

This patch replace the readme.txt file located in
board/qemu/<Qemu target>/ by a script (launch.sh).

This allow Buildroot user to start easily Qemu using
only one simple command:

$ ./board/qemu/aarch64-virt/launch.sh test/qemu_aarch64_virt/

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/aarch64-virt/launch.sh         |  7 +++++++
 board/qemu/aarch64-virt/readme.txt        |  7 -------
 board/qemu/arm-versatile-nommu/launch.sh  |  8 ++++++++
 board/qemu/arm-versatile-nommu/readme.txt |  8 --------
 board/qemu/arm-versatile/launch.sh        |  8 ++++++++
 board/qemu/arm-versatile/readme.txt       |  8 --------
 board/qemu/arm-vexpress-tz/launch.sh      |  3 +++
 board/qemu/arm-vexpress/launch.sh         | 11 +++++++++++
 board/qemu/arm-vexpress/readme.txt        | 11 -----------
 board/qemu/csky610-virt/launch.sh         |  5 +++++
 board/qemu/csky610-virt/readme.txt        |  5 -----
 board/qemu/csky807-virt/launch.sh         |  5 +++++
 board/qemu/csky807-virt/readme.txt        |  5 -----
 board/qemu/csky810-virt/launch.sh         |  5 +++++
 board/qemu/csky810-virt/readme.txt        |  5 -----
 board/qemu/csky860-virt/launch.sh         |  5 +++++
 board/qemu/csky860-virt/readme.txt        |  5 -----
 board/qemu/m68k-mcf5208/launch.sh         |  7 +++++++
 board/qemu/m68k-mcf5208/readme.txt        |  7 -------
 board/qemu/m68k-q800/launch.sh            |  8 ++++++++
 board/qemu/m68k-q800/readme.txt           |  8 --------
 board/qemu/microblazebe-mmu/launch.sh     |  7 +++++++
 board/qemu/microblazebe-mmu/readme.txt    |  7 -------
 board/qemu/microblazeel-mmu/launch.sh     |  7 +++++++
 board/qemu/microblazeel-mmu/readme.txt    |  7 -------
 board/qemu/mips32r2-malta/launch.sh       |  2 ++
 board/qemu/mips32r2-malta/readme.txt      |  9 ---------
 board/qemu/mips32r2el-malta/launch.sh     |  9 +++++++++
 board/qemu/mips32r2el-malta/readme.txt    |  9 ---------
 board/qemu/mips32r6-malta/launch.sh       |  7 +++++++
 board/qemu/mips32r6-malta/readme.txt      |  7 -------
 board/qemu/mips32r6el-malta/launch.sh     |  7 +++++++
 board/qemu/mips32r6el-malta/readme.txt    |  7 -------
 board/qemu/mips64-malta/launch.sh         |  8 ++++++++
 board/qemu/mips64-malta/readme.txt        |  8 --------
 board/qemu/mips64el-malta/launch.sh       |  8 ++++++++
 board/qemu/mips64el-malta/readme.txt      |  8 --------
 board/qemu/mips64r6-malta/launch.sh       |  7 +++++++
 board/qemu/mips64r6-malta/readme.txt      |  7 -------
 board/qemu/mips64r6el-malta/launch.sh     |  7 +++++++
 board/qemu/mips64r6el-malta/readme.txt    |  7 -------
 board/qemu/nios2-10m50/launch.sh          |  7 +++++++
 board/qemu/nios2-10m50/readme.txt         |  7 -------
 board/qemu/or1k/launch.sh                 |  9 +++++++++
 board/qemu/or1k/readme.txt                |  9 ---------
 board/qemu/ppc-g3beige/launch.sh          |  8 ++++++++
 board/qemu/ppc-g3beige/readme.txt         |  8 --------
 board/qemu/ppc-mac99/launch.sh            |  5 +++++
 board/qemu/ppc-mac99/readme.txt           |  5 -----
 board/qemu/ppc-mpc8544ds/launch.sh        |  7 +++++++
 board/qemu/ppc-mpc8544ds/readme.txt       |  7 -------
 board/qemu/ppc-virtex-ml507/launch.sh     |  7 +++++++
 board/qemu/ppc-virtex-ml507/readme.txt    |  7 -------
 board/qemu/ppc64-e5500/launch.sh          |  7 +++++++
 board/qemu/ppc64-e5500/readme.txt         |  7 -------
 board/qemu/ppc64-pseries/launch.sh        |  7 +++++++
 board/qemu/ppc64-pseries/readme.txt       |  7 -------
 board/qemu/ppc64le-pseries/launch.sh      |  7 +++++++
 board/qemu/ppc64le-pseries/readme.txt     |  7 -------
 board/qemu/riscv32-virt/launch.sh         |  7 +++++++
 board/qemu/riscv32-virt/readme.txt        |  7 -------
 board/qemu/riscv64-virt/launch.sh         |  8 ++++++++
 board/qemu/riscv64-virt/readme.txt        |  7 -------
 board/qemu/sh4-r2d/launch.sh              |  9 +++++++++
 board/qemu/sh4-r2d/readme.txt             |  8 --------
 board/qemu/sh4eb-r2d/launch.sh            |  8 ++++++++
 board/qemu/sh4eb-r2d/readme.txt           |  8 --------
 board/qemu/sparc-ss10/launch.sh           |  7 +++++++
 board/qemu/sparc-ss10/readme.txt          |  7 -------
 board/qemu/sparc64-sun4u/launch.sh        |  7 +++++++
 board/qemu/sparc64-sun4u/readme.txt       |  7 -------
 board/qemu/x86/launch.sh                  |  9 +++++++++
 board/qemu/x86/readme.txt                 |  9 ---------
 board/qemu/x86_64/launch.sh               |  9 +++++++++
 board/qemu/x86_64/readme.txt              |  9 ---------
 board/qemu/xtensa-lx60/launch.sh          |  7 +++++++
 board/qemu/xtensa-lx60/readme.txt         |  7 -------
 77 files changed, 276 insertions(+), 278 deletions(-)
 create mode 100755 board/qemu/aarch64-virt/launch.sh
 delete mode 100644 board/qemu/aarch64-virt/readme.txt
 create mode 100755 board/qemu/arm-versatile-nommu/launch.sh
 delete mode 100644 board/qemu/arm-versatile-nommu/readme.txt
 create mode 100755 board/qemu/arm-versatile/launch.sh
 delete mode 100644 board/qemu/arm-versatile/readme.txt
 create mode 100755 board/qemu/arm-vexpress-tz/launch.sh
 create mode 100755 board/qemu/arm-vexpress/launch.sh
 delete mode 100644 board/qemu/arm-vexpress/readme.txt
 create mode 100755 board/qemu/csky610-virt/launch.sh
 delete mode 100644 board/qemu/csky610-virt/readme.txt
 create mode 100755 board/qemu/csky807-virt/launch.sh
 delete mode 100644 board/qemu/csky807-virt/readme.txt
 create mode 100755 board/qemu/csky810-virt/launch.sh
 delete mode 100644 board/qemu/csky810-virt/readme.txt
 create mode 100755 board/qemu/csky860-virt/launch.sh
 delete mode 100644 board/qemu/csky860-virt/readme.txt
 create mode 100755 board/qemu/m68k-mcf5208/launch.sh
 delete mode 100644 board/qemu/m68k-mcf5208/readme.txt
 create mode 100755 board/qemu/m68k-q800/launch.sh
 delete mode 100644 board/qemu/m68k-q800/readme.txt
 create mode 100755 board/qemu/microblazebe-mmu/launch.sh
 delete mode 100644 board/qemu/microblazebe-mmu/readme.txt
 create mode 100755 board/qemu/microblazeel-mmu/launch.sh
 delete mode 100644 board/qemu/microblazeel-mmu/readme.txt
 create mode 100755 board/qemu/mips32r2-malta/launch.sh
 delete mode 100644 board/qemu/mips32r2-malta/readme.txt
 create mode 100755 board/qemu/mips32r2el-malta/launch.sh
 delete mode 100644 board/qemu/mips32r2el-malta/readme.txt
 create mode 100755 board/qemu/mips32r6-malta/launch.sh
 delete mode 100644 board/qemu/mips32r6-malta/readme.txt
 create mode 100755 board/qemu/mips32r6el-malta/launch.sh
 delete mode 100644 board/qemu/mips32r6el-malta/readme.txt
 create mode 100755 board/qemu/mips64-malta/launch.sh
 delete mode 100644 board/qemu/mips64-malta/readme.txt
 create mode 100755 board/qemu/mips64el-malta/launch.sh
 delete mode 100644 board/qemu/mips64el-malta/readme.txt
 create mode 100755 board/qemu/mips64r6-malta/launch.sh
 delete mode 100644 board/qemu/mips64r6-malta/readme.txt
 create mode 100755 board/qemu/mips64r6el-malta/launch.sh
 delete mode 100644 board/qemu/mips64r6el-malta/readme.txt
 create mode 100755 board/qemu/nios2-10m50/launch.sh
 delete mode 100644 board/qemu/nios2-10m50/readme.txt
 create mode 100755 board/qemu/or1k/launch.sh
 delete mode 100644 board/qemu/or1k/readme.txt
 create mode 100755 board/qemu/ppc-g3beige/launch.sh
 delete mode 100644 board/qemu/ppc-g3beige/readme.txt
 create mode 100755 board/qemu/ppc-mac99/launch.sh
 delete mode 100644 board/qemu/ppc-mac99/readme.txt
 create mode 100755 board/qemu/ppc-mpc8544ds/launch.sh
 delete mode 100644 board/qemu/ppc-mpc8544ds/readme.txt
 create mode 100755 board/qemu/ppc-virtex-ml507/launch.sh
 delete mode 100644 board/qemu/ppc-virtex-ml507/readme.txt
 create mode 100755 board/qemu/ppc64-e5500/launch.sh
 delete mode 100644 board/qemu/ppc64-e5500/readme.txt
 create mode 100755 board/qemu/ppc64-pseries/launch.sh
 delete mode 100644 board/qemu/ppc64-pseries/readme.txt
 create mode 100755 board/qemu/ppc64le-pseries/launch.sh
 delete mode 100644 board/qemu/ppc64le-pseries/readme.txt
 create mode 100755 board/qemu/riscv32-virt/launch.sh
 delete mode 100644 board/qemu/riscv32-virt/readme.txt
 create mode 100755 board/qemu/riscv64-virt/launch.sh
 delete mode 100644 board/qemu/riscv64-virt/readme.txt
 create mode 100755 board/qemu/sh4-r2d/launch.sh
 delete mode 100644 board/qemu/sh4-r2d/readme.txt
 create mode 100755 board/qemu/sh4eb-r2d/launch.sh
 delete mode 100644 board/qemu/sh4eb-r2d/readme.txt
 create mode 100755 board/qemu/sparc-ss10/launch.sh
 delete mode 100644 board/qemu/sparc-ss10/readme.txt
 create mode 100755 board/qemu/sparc64-sun4u/launch.sh
 delete mode 100644 board/qemu/sparc64-sun4u/readme.txt
 create mode 100755 board/qemu/x86/launch.sh
 delete mode 100644 board/qemu/x86/readme.txt
 create mode 100755 board/qemu/x86_64/launch.sh
 delete mode 100644 board/qemu/x86_64/readme.txt
 create mode 100755 board/qemu/xtensa-lx60/launch.sh
 delete mode 100644 board/qemu/xtensa-lx60/readme.txt

diff --git a/board/qemu/aarch64-virt/launch.sh b/board/qemu/aarch64-virt/launch.sh
new file mode 100755
index 0000000000..145bee4670
--- /dev/null
+++ b/board/qemu/aarch64-virt/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel ${1:-output}/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=${1:-output}/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
deleted file mode 100644
index f868905d91..0000000000
--- a/board/qemu/aarch64-virt/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile-nommu/launch.sh b/board/qemu/arm-versatile-nommu/launch.sh
new file mode 100755
index 0000000000..be404b8f62
--- /dev/null
+++ b/board/qemu/arm-versatile-nommu/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-arm -M versatilepb -kernel ${1:-output}/images/zImage -dtb ${1:-output}/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile-nommu/readme.txt b/board/qemu/arm-versatile-nommu/readme.txt
deleted file mode 100644
index d25cc4dc00..0000000000
--- a/board/qemu/arm-versatile-nommu/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile/launch.sh b/board/qemu/arm-versatile/launch.sh
new file mode 100755
index 0000000000..9f159371f1
--- /dev/null
+++ b/board/qemu/arm-versatile/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-arm -M versatilepb -kernel ${1:-output}/images/zImage -dtb ${1:-output}/images/versatile-pb.dtb -drive file=${1:-output}/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
deleted file mode 100644
index e514cefe82..0000000000
--- a/board/qemu/arm-versatile/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-vexpress-tz/launch.sh b/board/qemu/arm-vexpress-tz/launch.sh
new file mode 100755
index 0000000000..7ee494ce20
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/launch.sh
@@ -0,0 +1,3 @@
+#!/bin/env bash
+
+qemu-system-arm -machine virt -machine secure=on -cpu cortex-a15 -smp 1 -s -m 1024 -d unimp -serial stdio -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic -semihosting-config enable,target=native -bios ${1:-output}/images/bl1.bin
diff --git a/board/qemu/arm-vexpress/launch.sh b/board/qemu/arm-vexpress/launch.sh
new file mode 100755
index 0000000000..9578249f8e
--- /dev/null
+++ b/board/qemu/arm-vexpress/launch.sh
@@ -0,0 +1,11 @@
+#!/bin/env bash
+
+qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel ${1:-output}/images/zImage -dtb ${1:-output}/images/vexpress-v2p-ca9.dtb -drive file=${1:-output}/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 rootwait root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# If you want to emulate more cores change "-smp 1" to "-smp 2" for
+# dual-core or even "smp -4" for a quad-core configuration.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
deleted file mode 100644
index 7f7b43a3b3..0000000000
--- a/board/qemu/arm-vexpress/readme.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-Run the emulation with:
-
-  qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 rootwait root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-If you want to emulate more cores change "-smp 1" to "-smp 2" for
-dual-core or even "smp -4" for a quad-core configuration.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/csky610-virt/launch.sh b/board/qemu/csky610-virt/launch.sh
new file mode 100755
index 0000000000..4e1e138708
--- /dev/null
+++ b/board/qemu/csky610-virt/launch.sh
@@ -0,0 +1,5 @@
+#!/bin/env bash
+
+qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
+
+# The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky610-virt/readme.txt b/board/qemu/csky610-virt/readme.txt
deleted file mode 100644
index 6f9f7c18ce..0000000000
--- a/board/qemu/csky610-virt/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run with qemu:
-
- qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
-
-The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky807-virt/launch.sh b/board/qemu/csky807-virt/launch.sh
new file mode 100755
index 0000000000..9d34e60125
--- /dev/null
+++ b/board/qemu/csky807-virt/launch.sh
@@ -0,0 +1,5 @@
+#!/bin/env bash
+
+qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+# The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky807-virt/readme.txt b/board/qemu/csky807-virt/readme.txt
deleted file mode 100644
index 20b7fa312b..0000000000
--- a/board/qemu/csky807-virt/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run with qemu:
-
-qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
-
-The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky810-virt/launch.sh b/board/qemu/csky810-virt/launch.sh
new file mode 100755
index 0000000000..9d34e60125
--- /dev/null
+++ b/board/qemu/csky810-virt/launch.sh
@@ -0,0 +1,5 @@
+#!/bin/env bash
+
+qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+# The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky810-virt/readme.txt b/board/qemu/csky810-virt/readme.txt
deleted file mode 100644
index 758e436467..0000000000
--- a/board/qemu/csky810-virt/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run with qemu:
-
- qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
-
-The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky860-virt/launch.sh b/board/qemu/csky860-virt/launch.sh
new file mode 100755
index 0000000000..8d678f881d
--- /dev/null
+++ b/board/qemu/csky860-virt/launch.sh
@@ -0,0 +1,5 @@
+#!/bin/env bash
+
+qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
+
+# The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/csky860-virt/readme.txt b/board/qemu/csky860-virt/readme.txt
deleted file mode 100644
index bc6a55cdb7..0000000000
--- a/board/qemu/csky860-virt/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run with qemu:
-
- qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
-
-The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/board/qemu/m68k-mcf5208/launch.sh b/board/qemu/m68k-mcf5208/launch.sh
new file mode 100755
index 0000000000..5138619334
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel ${1:-output}/images/vmlinux -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
deleted file mode 100644
index d1c9086805..0000000000
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-q800/launch.sh b/board/qemu/m68k-q800/launch.sh
new file mode 100755
index 0000000000..ea0cd4c91e
--- /dev/null
+++ b/board/qemu/m68k-q800/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-m68k -M q800 -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0" -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.11.0 from https://github.com/vivier/qemu-m68k
+# You need following branch: q800-v2.11.0
diff --git a/board/qemu/m68k-q800/readme.txt b/board/qemu/m68k-q800/readme.txt
deleted file mode 100644
index b516bacdff..0000000000
--- a/board/qemu/m68k-q800/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
- qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0"
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.11.0 from https://github.com/vivier/qemu-m68k
-You need following branch: q800-v2.11.0
diff --git a/board/qemu/microblazebe-mmu/launch.sh b/board/qemu/microblazebe-mmu/launch.sh
new file mode 100755
index 0000000000..af7b1f575d
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-microblaze -M petalogix-s3adsp1800 -kernel ${1:-output}/images/linux.bin -serial stdio
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
deleted file mode 100644
index 4f52baff1f..0000000000
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/microblazeel-mmu/launch.sh b/board/qemu/microblazeel-mmu/launch.sh
new file mode 100755
index 0000000000..fb69e018d0
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel ${1:-output}/images/linux.bin -serial stdio
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
deleted file mode 100644
index 0b0f330a5e..0000000000
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2-malta/launch.sh b/board/qemu/mips32r2-malta/launch.sh
new file mode 100755
index 0000000000..8069b59171
--- /dev/null
+++ b/board/qemu/mips32r2-malta/launch.sh
@@ -0,0 +1,2 @@
+#!/bin/env bash
+
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
deleted file mode 100644
index 9ff3c4b810..0000000000
--- a/board/qemu/mips32r2-malta/readme.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Run the emulation with:
-
- qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer. No keyboard support has been
-enabled.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2el-malta/launch.sh b/board/qemu/mips32r2el-malta/launch.sh
new file mode 100755
index 0000000000..693306bdbc
--- /dev/null
+++ b/board/qemu/mips32r2el-malta/launch.sh
@@ -0,0 +1,9 @@
+#!/bin/env bash
+
+qemu-system-mipsel -M malta -kernel ${1:-output}/images/vmlinux -serial stdio -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer. No keyboard support has been
+# enabled.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
deleted file mode 100644
index 745bfea608..0000000000
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Run the emulation with:
-
- qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer. No keyboard support has been
-enabled.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6-malta/launch.sh b/board/qemu/mips32r6-malta/launch.sh
new file mode 100755
index 0000000000..b027b14993
--- /dev/null
+++ b/board/qemu/mips32r6-malta/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-mips -M malta -cpu mips32r6-generic -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
deleted file mode 100644
index 6a026b2165..0000000000
--- a/board/qemu/mips32r6-malta/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6el-malta/launch.sh b/board/qemu/mips32r6el-malta/launch.sh
new file mode 100755
index 0000000000..ad3806a406
--- /dev/null
+++ b/board/qemu/mips32r6el-malta/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
deleted file mode 100644
index f69fd21af1..0000000000
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64-malta/launch.sh b/board/qemu/mips64-malta/launch.sh
new file mode 100755
index 0000000000..471c7f4038
--- /dev/null
+++ b/board/qemu/mips64-malta/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-mips64 -M malta -kernel ${1:-output}/images/vmlinux -serial stdio -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
deleted file mode 100644
index ea3a92541e..0000000000
--- a/board/qemu/mips64-malta/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
- qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64el-malta/launch.sh b/board/qemu/mips64el-malta/launch.sh
new file mode 100755
index 0000000000..be7e5792d3
--- /dev/null
+++ b/board/qemu/mips64el-malta/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-mips64el -M malta -kernel ${1:-output}/images/vmlinux -serial stdio -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
deleted file mode 100644
index 144da93839..0000000000
--- a/board/qemu/mips64el-malta/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
- qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda"
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6-malta/launch.sh b/board/qemu/mips64r6-malta/launch.sh
new file mode 100755
index 0000000000..ea7cc6ceaa
--- /dev/null
+++ b/board/qemu/mips64r6-malta/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-mips64 -M malta -cpu I6400 -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
deleted file mode 100644
index cfa16fd863..0000000000
--- a/board/qemu/mips64r6-malta/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6el-malta/launch.sh b/board/qemu/mips64r6el-malta/launch.sh
new file mode 100755
index 0000000000..bb97b3c467
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-mips64el -M malta -cpu I6400 -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
deleted file mode 100644
index 61a6ceb5f4..0000000000
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/nios2-10m50/launch.sh b/board/qemu/nios2-10m50/launch.sh
new file mode 100755
index 0000000000..e7a709e6e8
--- /dev/null
+++ b/board/qemu/nios2-10m50/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-nios2 -kernel ${1:-output}/images/vmlinux -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0.
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
deleted file mode 100644
index 44cbcb08a2..0000000000
--- a/board/qemu/nios2-10m50/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-  qemu-system-nios2 -kernel output/images/vmlinux -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0.
diff --git a/board/qemu/or1k/launch.sh b/board/qemu/or1k/launch.sh
new file mode 100755
index 0000000000..6786d3f957
--- /dev/null
+++ b/board/qemu/or1k/launch.sh
@@ -0,0 +1,9 @@
+#!/bin/env bash
+
+qemu-system-or1k -kernel ${1:-output}/images/vmlinux -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Ethernet support is not working, yet.
+
+# Tested with QEMU 2.12.0.
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
deleted file mode 100644
index df6b467e82..0000000000
--- a/board/qemu/or1k/readme.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Run the emulation with:
-
- qemu-system-or1k -kernel output/images/vmlinux -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Ethernet support is not working, yet.
-
-Tested with QEMU 2.12.0.
diff --git a/board/qemu/ppc-g3beige/launch.sh b/board/qemu/ppc-g3beige/launch.sh
new file mode 100755
index 0000000000..de366f96d0
--- /dev/null
+++ b/board/qemu/ppc-g3beige/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-ppc -M g3beige -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
+
+# The login prompt will appear in the terminal that started Qemu. The
+# graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
deleted file mode 100644
index 608814ee3b..0000000000
--- a/board/qemu/ppc-g3beige/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
-
-The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-mac99/launch.sh b/board/qemu/ppc-mac99/launch.sh
new file mode 100755
index 0000000000..251379923c
--- /dev/null
+++ b/board/qemu/ppc-mac99/launch.sh
@@ -0,0 +1,5 @@
+#!/bin/env bash
+
+qemu-system-ppc -M mac99 -cpu g4 -m 1G -kernel ${1:-output}/images/vmlinux -drive file=${1:-output}/images/rootfs.ext2,format=raw  -net nic,model=sungem -net user -append "root=/dev/sda" -nographic -vga none
+
+# Tested with QEMU 3.1.0
diff --git a/board/qemu/ppc-mac99/readme.txt b/board/qemu/ppc-mac99/readme.txt
deleted file mode 100644
index a8a18db5b9..0000000000
--- a/board/qemu/ppc-mac99/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run the emulation with:
-
-  qemu-system-ppc -nographic -vga none -M mac99 -cpu g4 -m 1G -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -net nic,model=sungem -net user -append "root=/dev/sda"
-
-Tested with QEMU 3.1.0
diff --git a/board/qemu/ppc-mpc8544ds/launch.sh b/board/qemu/ppc-mpc8544ds/launch.sh
new file mode 100755
index 0000000000..ef5a3de413
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-ppc -M mpc8544ds -kernel ${1:-output}/images/vmlinux -serial stdio -net nic,model=e1000 -net user
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
deleted file mode 100644
index 172aad5626..0000000000
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-virtex-ml507/launch.sh b/board/qemu/ppc-virtex-ml507/launch.sh
new file mode 100755
index 0000000000..cb38249e54
--- /dev/null
+++ b/board/qemu/ppc-virtex-ml507/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-ppc -M virtex-ml507 -m 256 -kernel ${1:-output}/images/vmlinux -dtb ${1:-output}/images/virtex440-ml507.dtb -append "console=ttyS0" -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
deleted file mode 100644
index 6178ace816..0000000000
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-e5500/launch.sh b/board/qemu/ppc64-e5500/launch.sh
new file mode 100755
index 0000000000..e241e016b4
--- /dev/null
+++ b/board/qemu/ppc64-e5500/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel ${1:-output}/images/uImage -drive file=${1:-output}/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
deleted file mode 100644
index 8080766984..0000000000
--- a/board/qemu/ppc64-e5500/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-pseries/launch.sh b/board/qemu/ppc64-pseries/launch.sh
new file mode 100755
index 0000000000..13f7454a7d
--- /dev/null
+++ b/board/qemu/ppc64-pseries/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel ${1:-output}/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=${1:-output}/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
deleted file mode 100644
index 6a3e96a2e5..0000000000
--- a/board/qemu/ppc64-pseries/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64le-pseries/launch.sh b/board/qemu/ppc64le-pseries/launch.sh
new file mode 100755
index 0000000000..3a7e9d3d4f
--- /dev/null
+++ b/board/qemu/ppc64le-pseries/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel ${1:-output}/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=${1:-output}/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
+
+# The login prompt will appear in the terminal window.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
deleted file mode 100644
index 2728675df2..0000000000
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
-
-The login prompt will appear in the terminal window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/riscv32-virt/launch.sh b/board/qemu/riscv32-virt/launch.sh
new file mode 100755
index 0000000000..63ff466a94
--- /dev/null
+++ b/board/qemu/riscv32-virt/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-riscv32 -M virt -kernel ${1:-output}/images/fw_jump.elf -device loader,file=${1:-output}/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=${1:-output}/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 3.1
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
deleted file mode 100644
index 5d7c1988d2..0000000000
--- a/board/qemu/riscv32-virt/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run Linux in emulation with:
-
-  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 3.1
diff --git a/board/qemu/riscv64-virt/launch.sh b/board/qemu/riscv64-virt/launch.sh
new file mode 100755
index 0000000000..321967555a
--- /dev/null
+++ b/board/qemu/riscv64-virt/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-riscv64 -M virt -kernel ${1:-output}/images/fw_jump.elf -device loader,file=${1:-output}/images/Image,addr=0x80200000 -append "rootwait root=/dev/vda ro" -drive file=${1:-output}/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 3.1
+
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
deleted file mode 100644
index c075cc464d..0000000000
--- a/board/qemu/riscv64-virt/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run Linux in emulation with:
-
-  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 3.1
diff --git a/board/qemu/sh4-r2d/launch.sh b/board/qemu/sh4-r2d/launch.sh
new file mode 100755
index 0000000000..75be3b9438
--- /dev/null
+++ b/board/qemu/sh4-r2d/launch.sh
@@ -0,0 +1,9 @@
+#!/bin/env bash
+
+qemu-system-sh4 -M r2d -kernel ${1:-output}/images/zImage -drive file=${1:-output}/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
+
+# The login prompt will appear in the terminal that started Qemu.
+# The graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
+
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
deleted file mode 100644
index dd80953b97..0000000000
--- a/board/qemu/sh4-r2d/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
-
-The login prompt will appear in the terminal that started Qemu.
-The graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sh4eb-r2d/launch.sh b/board/qemu/sh4eb-r2d/launch.sh
new file mode 100755
index 0000000000..b18bdfeed1
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/launch.sh
@@ -0,0 +1,8 @@
+#!/bin/env bash
+
+qemu-system-sh4eb -M r2d -kernel ${1:-output}/images/zImage -drive file=${1:-output}/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
+
+# The login prompt will appear in the terminal that started Qemu.
+# The graphical window is the framebuffer.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
deleted file mode 100644
index e71a9bce90..0000000000
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Run the emulation with:
-
-  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "rootwait root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
-
-The login prompt will appear in the terminal that started Qemu.
-The graphical window is the framebuffer.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc-ss10/launch.sh b/board/qemu/sparc-ss10/launch.sh
new file mode 100755
index 0000000000..9cdc086e82
--- /dev/null
+++ b/board/qemu/sparc-ss10/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-sparc -M SS-10 -kernel ${1:-output}/images/zImage -drive file=${1:-output}/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
deleted file mode 100644
index 33833c2d33..0000000000
--- a/board/qemu/sparc-ss10/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc64-sun4u/launch.sh b/board/qemu/sparc64-sun4u/launch.sh
new file mode 100755
index 0000000000..7629bc9d37
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-sparc64 -M sun4u -kernel ${1:-output}/images/vmlinux -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=${1:-output}/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
deleted file mode 100644
index f2e6e81a86..0000000000
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
-  qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "rootwait root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=output/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/x86/launch.sh b/board/qemu/x86/launch.sh
new file mode 100755
index 0000000000..c678278851
--- /dev/null
+++ b/board/qemu/x86/launch.sh
@@ -0,0 +1,9 @@
+#!/bin/env bash
+
+qemu-system-i386 -M pc -kernel ${1:-output}/images/bzImage -drive file=${1:-output}/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
+
+# Optionally add -smp N to emulate a SMP system with N CPUs.
+
+# The login prompt will appear in the graphical window.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
deleted file mode 100644
index 3bbafecf91..0000000000
--- a/board/qemu/x86/readme.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Run the emulation with:
-
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
-
-Optionally add -smp N to emulate a SMP system with N CPUs.
-
-The login prompt will appear in the graphical window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/x86_64/launch.sh b/board/qemu/x86_64/launch.sh
new file mode 100755
index 0000000000..7c98a7185e
--- /dev/null
+++ b/board/qemu/x86_64/launch.sh
@@ -0,0 +1,9 @@
+#!/bin/env bash
+
+qemu-system-x86_64 -M pc -kernel ${1:-output}/images/bzImage -drive file=${1:-output}/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
+
+# Optionally add -smp N to emulate a SMP system with N CPUs.
+
+# The login prompt will appear in the graphical window.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
deleted file mode 100644
index 93ac22a947..0000000000
--- a/board/qemu/x86_64/readme.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Run the emulation with:
-
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user
-
-Optionally add -smp N to emulate a SMP system with N CPUs.
-
-The login prompt will appear in the graphical window.
-
-Tested with QEMU 2.12.0
diff --git a/board/qemu/xtensa-lx60/launch.sh b/board/qemu/xtensa-lx60/launch.sh
new file mode 100755
index 0000000000..1d045b0053
--- /dev/null
+++ b/board/qemu/xtensa-lx60/launch.sh
@@ -0,0 +1,7 @@
+#!/bin/env bash
+
+qemu-system-xtensa -M lx60 -cpu dc233c -kernel ${1:-output}/images/Image.elf -monitor null -nographic 
+
+# The login prompt will appear in the terminal that started Qemu.
+
+# Tested with QEMU 2.12.0
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
deleted file mode 100644
index 4287e1f09e..0000000000
--- a/board/qemu/xtensa-lx60/readme.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Run the emulation with:
-
- qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf
-
-The login prompt will appear in the terminal that started Qemu.
-
-Tested with QEMU 2.12.0
-- 
2.21.0
