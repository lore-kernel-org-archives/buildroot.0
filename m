From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun,  5 May 2019 18:53:57 +0200
Subject: [Buildroot] [PATCH v2 5/7] board/qemu/*/launch.sh: add qemu launch
 script
In-Reply-To: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557075239-30667-6-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

launch.sh replaces old readme.txt files.
This change allows to test qemu architectures
and check if build process went successful.
This script contains the command used to launch
each qemu machine.
The readme.txt files contains few information which
is another good reason to replace them.

For backward compatibility, readme.txt is
still accessible using 'launch.sh -h'.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 board/qemu/aarch64-virt/launch.sh     | 21 +++++++++++++++++++++
 board/qemu/arm-versatile/launch.sh    | 26 ++++++++++++++++++++++++++
 board/qemu/arm-vexpress/launch.sh     | 25 +++++++++++++++++++++++++
 board/qemu/m68k-mcf5208/launch.sh     | 21 +++++++++++++++++++++
 board/qemu/m68k-q800/launch.sh        | 22 ++++++++++++++++++++++
 board/qemu/microblazebe-mmu/launch.sh | 21 +++++++++++++++++++++
 board/qemu/microblazeel-mmu/launch.sh | 21 +++++++++++++++++++++
 board/qemu/mips32r2-malta/launch.sh   | 23 +++++++++++++++++++++++
 board/qemu/mips32r2el-malta/launch.sh | 23 +++++++++++++++++++++++
 board/qemu/mips32r6-malta/launch.sh   | 21 +++++++++++++++++++++
 board/qemu/mips32r6el-malta/launch.sh | 21 +++++++++++++++++++++
 board/qemu/mips64-malta/launch.sh     | 22 ++++++++++++++++++++++
 board/qemu/mips64el-malta/launch.sh   | 22 ++++++++++++++++++++++
 board/qemu/mips64r6-malta/launch.sh   | 21 +++++++++++++++++++++
 board/qemu/mips64r6el-malta/launch.sh | 21 +++++++++++++++++++++
 board/qemu/nios2-10m50/launch.sh      | 21 +++++++++++++++++++++
 board/qemu/or1k/launch.sh             | 23 +++++++++++++++++++++++
 board/qemu/ppc-g3beige/launch.sh      | 22 ++++++++++++++++++++++
 board/qemu/ppc-mpc8544ds/launch.sh    | 21 +++++++++++++++++++++
 board/qemu/ppc-virtex-ml507/launch.sh | 21 +++++++++++++++++++++
 board/qemu/ppc64-e5500/launch.sh      | 21 +++++++++++++++++++++
 board/qemu/ppc64-pseries/launch.sh    | 21 +++++++++++++++++++++
 board/qemu/ppc64le-pseries/launch.sh  | 21 +++++++++++++++++++++
 board/qemu/riscv32-virt/launch.sh     | 21 +++++++++++++++++++++
 board/qemu/riscv64-virt/launch.sh     | 21 +++++++++++++++++++++
 board/qemu/sh4-r2d/launch.sh          | 22 ++++++++++++++++++++++
 board/qemu/sh4eb-r2d/launch.sh        | 22 ++++++++++++++++++++++
 board/qemu/sparc-ss10/launch.sh       | 21 +++++++++++++++++++++
 board/qemu/sparc64-sun4u/launch.sh    | 21 +++++++++++++++++++++
 board/qemu/x86/launch.sh              | 23 +++++++++++++++++++++++
 board/qemu/x86_64/launch.sh           | 23 +++++++++++++++++++++++
 board/qemu/xtensa-lx60/launch.sh      | 21 +++++++++++++++++++++
 32 files changed, 697 insertions(+)
 create mode 100755 board/qemu/aarch64-virt/launch.sh
 create mode 100755 board/qemu/arm-versatile/launch.sh
 create mode 100755 board/qemu/arm-vexpress/launch.sh
 create mode 100755 board/qemu/m68k-mcf5208/launch.sh
 create mode 100755 board/qemu/m68k-q800/launch.sh
 create mode 100755 board/qemu/microblazebe-mmu/launch.sh
 create mode 100755 board/qemu/microblazeel-mmu/launch.sh
 create mode 100755 board/qemu/mips32r2-malta/launch.sh
 create mode 100755 board/qemu/mips32r2el-malta/launch.sh
 create mode 100755 board/qemu/mips32r6-malta/launch.sh
 create mode 100755 board/qemu/mips32r6el-malta/launch.sh
 create mode 100755 board/qemu/mips64-malta/launch.sh
 create mode 100755 board/qemu/mips64el-malta/launch.sh
 create mode 100755 board/qemu/mips64r6-malta/launch.sh
 create mode 100755 board/qemu/mips64r6el-malta/launch.sh
 create mode 100755 board/qemu/nios2-10m50/launch.sh
 create mode 100755 board/qemu/or1k/launch.sh
 create mode 100755 board/qemu/ppc-g3beige/launch.sh
 create mode 100755 board/qemu/ppc-mpc8544ds/launch.sh
 create mode 100755 board/qemu/ppc-virtex-ml507/launch.sh
 create mode 100755 board/qemu/ppc64-e5500/launch.sh
 create mode 100755 board/qemu/ppc64-pseries/launch.sh
 create mode 100755 board/qemu/ppc64le-pseries/launch.sh
 create mode 100755 board/qemu/riscv32-virt/launch.sh
 create mode 100755 board/qemu/riscv64-virt/launch.sh
 create mode 100755 board/qemu/sh4-r2d/launch.sh
 create mode 100755 board/qemu/sh4eb-r2d/launch.sh
 create mode 100755 board/qemu/sparc-ss10/launch.sh
 create mode 100755 board/qemu/sparc64-sun4u/launch.sh
 create mode 100755 board/qemu/x86/launch.sh
 create mode 100755 board/qemu/x86_64/launch.sh
 create mode 100755 board/qemu/xtensa-lx60/launch.sh

diff --git a/board/qemu/aarch64-virt/launch.sh b/board/qemu/aarch64-virt/launch.sh
new file mode 100755
index 0000000..c6af589
--- /dev/null
+++ b/board/qemu/aarch64-virt/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/arm-versatile/launch.sh b/board/qemu/arm-versatile/launch.sh
new file mode 100755
index 0000000..bc856dd
--- /dev/null
+++ b/board/qemu/arm-versatile/launch.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+qemu_command='qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+Or for the noMMU emulation:
+
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append \"console=ttyAMA0,115200\" -serial stdio -net user -net nic,model=smc91c111
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/arm-vexpress/launch.sh b/board/qemu/arm-vexpress/launch.sh
new file mode 100755
index 0000000..c20b7cf
--- /dev/null
+++ b/board/qemu/arm-vexpress/launch.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+qemu_command='qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+If you want to emulate more cores change \"-smp 1\" to \"-smp 2\" for
+dual-core or even \"smp -4\" for a quad-core configuration.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/m68k-mcf5208/launch.sh b/board/qemu/m68k-mcf5208/launch.sh
new file mode 100755
index 0000000..ce1af2f
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-m68k -M mcf5208evb -cpu m5208 -kernel output/images/vmlinux -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/m68k-q800/launch.sh b/board/qemu/m68k-q800/launch.sh
new file mode 100755
index 0000000..734dbc3
--- /dev/null
+++ b/board/qemu/m68k-q800/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-m68k -M q800 -kernel output/images/vmlinux -nographic -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/sda console=ttyS0"'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.11.0 from https://github.com/vivier/qemu-m68k
+You need following branch: q800-v2.11.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/microblazebe-mmu/launch.sh b/board/qemu/microblazebe-mmu/launch.sh
new file mode 100755
index 0000000..d346e37
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/microblazeel-mmu/launch.sh b/board/qemu/microblazeel-mmu/launch.sh
new file mode 100755
index 0000000..aade62e
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips32r2-malta/launch.sh b/board/qemu/mips32r2-malta/launch.sh
new file mode 100755
index 0000000..e860632
--- /dev/null
+++ b/board/qemu/mips32r2-malta/launch.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -net nic,model=pcnet -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer. No keyboard support has been
+enabled.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips32r2el-malta/launch.sh b/board/qemu/mips32r2el-malta/launch.sh
new file mode 100755
index 0000000..12a4536
--- /dev/null
+++ b/board/qemu/mips32r2el-malta/launch.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -net nic,model=pcnet -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer. No keyboard support has been
+enabled.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips32r6-malta/launch.sh b/board/qemu/mips32r6-malta/launch.sh
new file mode 100755
index 0000000..442b026
--- /dev/null
+++ b/board/qemu/mips32r6-malta/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips32r6el-malta/launch.sh b/board/qemu/mips32r6el-malta/launch.sh
new file mode 100755
index 0000000..dc75962
--- /dev/null
+++ b/board/qemu/mips32r6el-malta/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -net nic,model=pcnet -net user -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips64-malta/launch.sh b/board/qemu/mips64-malta/launch.sh
new file mode 100755
index 0000000..95114ea
--- /dev/null
+++ b/board/qemu/mips64-malta/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda"'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips64el-malta/launch.sh b/board/qemu/mips64el-malta/launch.sh
new file mode 100755
index 0000000..4c220aa
--- /dev/null
+++ b/board/qemu/mips64el-malta/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda"'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips64r6-malta/launch.sh b/board/qemu/mips64r6-malta/launch.sh
new file mode 100755
index 0000000..b9a8b97
--- /dev/null
+++ b/board/qemu/mips64r6-malta/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/mips64r6el-malta/launch.sh b/board/qemu/mips64r6el-malta/launch.sh
new file mode 100755
index 0000000..0b13222
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/hda" -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/nios2-10m50/launch.sh b/board/qemu/nios2-10m50/launch.sh
new file mode 100755
index 0000000..c863f4f
--- /dev/null
+++ b/board/qemu/nios2-10m50/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-nios2 -kernel output/images/vmlinux -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0."
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/or1k/launch.sh b/board/qemu/or1k/launch.sh
new file mode 100755
index 0000000..44126c6
--- /dev/null
+++ b/board/qemu/or1k/launch.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+qemu_command='qemu-system-or1k -kernel output/images/vmlinux -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Ethernet support is not working, yet.
+
+Tested with QEMU 2.12.0."
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc-g3beige/launch.sh b/board/qemu/ppc-g3beige/launch.sh
new file mode 100755
index 0000000..a181b5a
--- /dev/null
+++ b/board/qemu/ppc-g3beige/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc-mpc8544ds/launch.sh b/board/qemu/ppc-mpc8544ds/launch.sh
new file mode 100755
index 0000000..338c1e2
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc -M mpc8544ds -kernel output/images/vmlinux -serial stdio -net nic,model=e1000 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc-virtex-ml507/launch.sh b/board/qemu/ppc-virtex-ml507/launch.sh
new file mode 100755
index 0000000..24696cd
--- /dev/null
+++ b/board/qemu/ppc-virtex-ml507/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc64-e5500/launch.sh b/board/qemu/ppc64-e5500/launch.sh
new file mode 100755
index 0000000..d054187
--- /dev/null
+++ b/board/qemu/ppc64-e5500/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 root=/dev/vda" -serial mon:stdio -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc64-pseries/launch.sh b/board/qemu/ppc64-pseries/launch.sh
new file mode 100755
index 0000000..6ee7c27
--- /dev/null
+++ b/board/qemu/ppc64-pseries/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/ppc64le-pseries/launch.sh b/board/qemu/ppc64le-pseries/launch.sh
new file mode 100755
index 0000000..c83f516
--- /dev/null
+++ b/board/qemu/ppc64le-pseries/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal window.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/riscv32-virt/launch.sh b/board/qemu/riscv32-virt/launch.sh
new file mode 100755
index 0000000..e2d2a39
--- /dev/null
+++ b/board/qemu/riscv32-virt/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 3.1"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/riscv64-virt/launch.sh b/board/qemu/riscv64-virt/launch.sh
new file mode 100755
index 0000000..a0a25b5
--- /dev/null
+++ b/board/qemu/riscv64-virt/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 3.1"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/sh4-r2d/launch.sh b/board/qemu/sh4-r2d/launch.sh
new file mode 100755
index 0000000..0eee795
--- /dev/null
+++ b/board/qemu/sh4-r2d/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+The graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/sh4eb-r2d/launch.sh b/board/qemu/sh4eb-r2d/launch.sh
new file mode 100755
index 0000000..09f3647
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/launch.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+qemu_command='qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+The graphical window is the framebuffer.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/sparc-ss10/launch.sh b/board/qemu/sparc-ss10/launch.sh
new file mode 100755
index 0000000..1221845
--- /dev/null
+++ b/board/qemu/sparc-ss10/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,format=raw -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/sparc64-sun4u/launch.sh b/board/qemu/sparc64-sun4u/launch.sh
new file mode 100755
index 0000000..a062596
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-sparc64 -M sun4u -kernel output/images/vmlinux -append "root=/dev/sda console=ttyS0,115200" -serial stdio -drive file=output/images/rootfs.ext2,format=raw -net nic,model=e1000 -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/x86/launch.sh b/board/qemu/x86/launch.sh
new file mode 100755
index 0000000..01a0697
--- /dev/null
+++ b/board/qemu/x86/launch.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+qemu_command='qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/x86_64/launch.sh b/board/qemu/x86_64/launch.sh
new file mode 100755
index 0000000..fd71498
--- /dev/null
+++ b/board/qemu/x86_64/launch.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+qemu_command='qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
diff --git a/board/qemu/xtensa-lx60/launch.sh b/board/qemu/xtensa-lx60/launch.sh
new file mode 100755
index 0000000..1427edc
--- /dev/null
+++ b/board/qemu/xtensa-lx60/launch.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+qemu_command='qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf'
+
+function DisplayReadme {
+	echo "Run the emulation with:
+
+${qemu_command}
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.0"
+}
+
+if [ ! -z $1 ] && [ $1 = "-h" ]
+then
+	DisplayReadme
+else
+	
+	echo "${qemu_command}"
+fi
-- 
2.7.4
