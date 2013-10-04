From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 15:06:08 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump relevant config versions
Message-ID: <20131004130856.42F499B93F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c859079cd60c3a6b57f87960c5b4823797ce95d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arm_nuri needs some DT fixups to switch to the 3.11.x series since it's
now default for that kernel defconfig.

[Peter: adjust comment in sparc defconfig to match]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/arm-nuri/readme.txt                     |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/arm-versatile/readme.txt                |    2 +-
 board/qemu/arm-vexpress/readme.txt                 |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/microblazebe-mmu/readme.txt             |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/microblazeel-mmu/readme.txt             |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/mips-malta/readme.txt                   |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/mips64-malta/readme.txt                 |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/powerpc-g3beige/readme.txt              |    4 ++--
 board/qemu/powerpc-mpc8544ds/readme.txt            |    2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt         |    2 +-
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 board/qemu/sparc-ss10/readme.txt                   |    2 +-
 .../x86/{linux-3.10.config => linux-3.11.config}   |    0
 board/qemu/x86/readme.txt                          |    2 +-
 .../{linux-3.10.config => linux-3.11.config}       |    0
 board/qemu/x86_64/readme.txt                       |    2 +-
 configs/qemu_mips64_malta_defconfig                |    8 ++++----
 configs/qemu_sparc_ss10_defconfig                  |    6 +++---
 26 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 0c64492..0fed2f7 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/arm-versatile/linux-3.10.config b/board/qemu/arm-versatile/linux-3.11.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.10.config
rename to board/qemu/arm-versatile/linux-3.11.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index e734d56..4902c54 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index bde90ef..65d1996 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/microblazebe-mmu/linux-3.10.config b/board/qemu/microblazebe-mmu/linux-3.11.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.10.config
rename to board/qemu/microblazebe-mmu/linux-3.11.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 7d172d1..473a934 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/microblazeel-mmu/linux-3.10.config b/board/qemu/microblazeel-mmu/linux-3.11.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.10.config
rename to board/qemu/microblazeel-mmu/linux-3.11.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 9728a45..baddc7a 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/mips-malta/linux-3.10.config b/board/qemu/mips-malta/linux-3.11.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.10.config
rename to board/qemu/mips-malta/linux-3.11.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index ccdcc84..33764ea 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/mips64-malta/linux-3.10.config b/board/qemu/mips64-malta/linux-3.11.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.10.config
rename to board/qemu/mips64-malta/linux-3.11.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 7361722..23b85ab 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -8,4 +8,4 @@ enabled.
 
 This configuration is known to be flaky.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/mipsel-malta/linux-3.10.config b/board/qemu/mipsel-malta/linux-3.11.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.10.config
rename to board/qemu/mipsel-malta/linux-3.11.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 52d424d..1e17828 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/powerpc-g3beige/linux-3.10.config b/board/qemu/powerpc-g3beige/linux-3.11.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.10.config
rename to board/qemu/powerpc-g3beige/linux-3.11.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index b5c73a4..4c0bf8a 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -1,8 +1,8 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append "console=ttyS0 root=/dev/hdc" -serial stdio -net nic,model=rtl8139 -net user
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index dfe1ac2..8c57ead 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index f4bc5d5..e958d49 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 34f4857..45fca86 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 8f4b5be..dab4028 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/x86/linux-3.10.config b/board/qemu/x86/linux-3.11.config
similarity index 100%
rename from board/qemu/x86/linux-3.10.config
rename to board/qemu/x86/linux-3.11.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 7bc3a1c..5f3af40 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/board/qemu/x86_64/linux-3.10.config b/board/qemu/x86_64/linux-3.11.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.10.config
rename to board/qemu/x86_64/linux-3.11.config
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index b6f4659..d9eaf56 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.5.2
+Tested with QEMU 1.6.0
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 61abdcf..035cfa1 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -10,16 +10,16 @@ BR2_PREFER_STATIC_LIB=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.3"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 33f0b21..ad1b136 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,13 +6,13 @@ BR2_sparc_v8=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.7.10"
+BR2_DEFAULT_KERNEL_VERSION="3.11.3"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
