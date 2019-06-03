From: guoren at kernel.org <guoren@kernel.org>
Date: Mon,  3 Jun 2019 16:51:05 +0800
Subject: [Buildroot] [PATCH V6] configs/qemu_cskyXXX_virt: new defconfig
Message-ID: <1559551865-8662-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Add C-SKY defconfig for QEMU virt machine.

Tested with https://gitlab.com/c-sky/buildroot/pipelines

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  4 ++++
 DEVELOPERS                                  |  2 ++
 board/qemu/csky/linux-ck610.config.fragment |  5 +++++
 board/qemu/csky/linux-ck807.config.fragment |  5 +++++
 board/qemu/csky/linux-ck810.config.fragment |  5 +++++
 board/qemu/csky/linux-ck860.config.fragment |  9 +++++++++
 board/qemu/csky/readme.txt                  | 12 ++++++++++++
 configs/qemu_csky610_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky807_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky810_virt_defconfig         | 14 ++++++++++++++
 configs/qemu_csky860_virt_defconfig         | 14 ++++++++++++++
 11 files changed, 98 insertions(+)
 create mode 100644 board/qemu/csky/linux-ck610.config.fragment
 create mode 100644 board/qemu/csky/linux-ck807.config.fragment
 create mode 100644 board/qemu/csky/linux-ck810.config.fragment
 create mode 100644 board/qemu/csky/linux-ck860.config.fragment
 create mode 100644 board/qemu/csky/readme.txt
 create mode 100644 configs/qemu_csky610_virt_defconfig
 create mode 100644 configs/qemu_csky807_virt_defconfig
 create mode 100644 configs/qemu_csky810_virt_defconfig
 create mode 100644 configs/qemu_csky860_virt_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 374dbfe..4fa3473 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -248,6 +248,10 @@ qemu_aarch64_virt_defconfig: { extends: .defconfig }
 qemu_arm_versatile_defconfig: { extends: .defconfig }
 qemu_arm_versatile_nommu_defconfig: { extends: .defconfig }
 qemu_arm_vexpress_defconfig: { extends: .defconfig }
+qemu_csky610_virt_defconfig: { extends: .defconfig }
+qemu_csky807_virt_defconfig: { extends: .defconfig }
+qemu_csky810_virt_defconfig: { extends: .defconfig }
+qemu_csky860_virt_defconfig: { extends: .defconfig }
 qemu_m68k_mcf5208_defconfig: { extends: .defconfig }
 qemu_m68k_q800_defconfig: { extends: .defconfig }
 qemu_microblazebe_mmu_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 5bfc456..edb372e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -976,7 +976,9 @@ F:	package/reaver/
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
 F:	board/csky/
+F:	board/qemu/csky
 F:	configs/csky_*
+F:	configs/qemu_csky*
 
 N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
 F:	configs/arm_juno_defconfig
diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
new file mode 100644
index 0000000..d80d0ee
--- /dev/null
+++ b/board/qemu/csky/linux-ck610.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK610=y
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
+CONFIG_GX6605S_TIMER=y
diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config.fragment
new file mode 100644
index 0000000..b6974f0
--- /dev/null
+++ b/board/qemu/csky/linux-ck807.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK807=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config.fragment
new file mode 100644
index 0000000..50fa1f4
--- /dev/null
+++ b/board/qemu/csky/linux-ck810.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK810=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config.fragment
new file mode 100644
index 0000000..e8f6af1
--- /dev/null
+++ b/board/qemu/csky/linux-ck860.config.fragment
@@ -0,0 +1,9 @@
+CONFIG_COMPILE_TEST=y
+CONFIG_CPU_CK860=y
+# CONFIG_CPU_HAS_FPU is not set
+CONFIG_CPU_PM_WAIT=y
+CONFIG_SMP=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_CSKY_APB_INTC=y
+CONFIG_CSKY_MPINTC=y
+CONFIG_CSKY_MP_TIMER=y
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
new file mode 100644
index 0000000..89d68aa
--- /dev/null
+++ b/board/qemu/csky/readme.txt
@@ -0,0 +1,12 @@
+Run with qemu:
+
+For ck860 smp:
+ qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux
+
+For ck810/ck807:
+ qemu-system-cskyv2 -M virt -nographic -kernel vmlinux
+
+For ck610:
+ qemu-system-cskyv1 -M virt -nographic -kernel vmlinux
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
new file mode 100644
index 0000000..b75a5b8
--- /dev/null
+++ b/configs/qemu_csky610_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck610=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
new file mode 100644
index 0000000..035bf66
--- /dev/null
+++ b/configs/qemu_csky807_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck807=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
new file mode 100644
index 0000000..9ce2aa9
--- /dev/null
+++ b/configs/qemu_csky810_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck810=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
new file mode 100644
index 0000000..d86c1e6
--- /dev/null
+++ b/configs/qemu_csky860_virt_defconfig
@@ -0,0 +1,14 @@
+# Architecture
+BR2_csky=y
+BR2_ck860=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
-- 
2.7.4
