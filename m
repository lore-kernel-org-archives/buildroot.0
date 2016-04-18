From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:25:16 +0200
Subject: [Buildroot] [git commit] configs/qemu_xtensa_lx60_defconfig: switch
	to dc233c
Message-ID: <20160418192629.6602981851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f82d0185b6b961a3650c9f1323977fb6eb4f38c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dc232b is MMUv2 core, dc233c is very similar MMUv3 core. MMUv3 is the
latest full MMU for xtensa, which allows running both MMU and noMMU
linux variants.
Update configuration overlay and linux config file.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/xtensa-lx60/linux-4.4.config            |   4 ++--
 board/qemu/xtensa-lx60/readme.txt                  |   4 ++--
 .../{xtensa_dc232b.tar => xtensa_dc233c.tar}       | Bin 747520 -> 808960 bytes
 configs/qemu_xtensa_lx60_defconfig                 |   2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/xtensa-lx60/linux-4.4.config b/board/qemu/xtensa-lx60/linux-4.4.config
index 51701b2..2d8e58d 100644
--- a/board/qemu/xtensa-lx60/linux-4.4.config
+++ b/board/qemu/xtensa-lx60/linux-4.4.config
@@ -1,8 +1,8 @@
 # CONFIG_SWAP is not set
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_XTENSA_VARIANT_DC232B=y
-# CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
+CONFIG_XTENSA_VARIANT_DC233C=y
+CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,38400"
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 04393ea..22f5e5a 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -1,7 +1,7 @@
 Run the emulation with:
 
- qemu-system-xtensa -M lx60 -cpu dc232b -monitor null -nographic -kernel output/images/Image.elf
+ qemu-system-xtensa -M lx60 -cpu dc233c -monitor null -nographic -kernel output/images/Image.elf
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.3.0
+Tested with QEMU 2.5.0
diff --git a/board/qemu/xtensa-lx60/xtensa_dc232b.tar b/board/qemu/xtensa-lx60/xtensa_dc233c.tar
similarity index 65%
rename from board/qemu/xtensa-lx60/xtensa_dc232b.tar
rename to board/qemu/xtensa-lx60/xtensa_dc233c.tar
index 77080e0..1a97d7a 100644
Binary files a/board/qemu/xtensa-lx60/xtensa_dc232b.tar and b/board/qemu/xtensa-lx60/xtensa_dc233c.tar differ
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 4170bba..e464c72 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CUSTOM_NAME="dc232b"
+BR2_XTENSA_CUSTOM_NAME="dc233c"
 BR2_XTENSA_CORE_NAME="lx60"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
