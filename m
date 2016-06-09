From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:04:35 +0200
Subject: [Buildroot] [git commit] configs/arm_juno: add support for Juno r2
Message-ID: <20160609200443.10DE27FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=234d81bf333b7eef52d009b3ecc25cfd7b484b29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/arm/juno/readme.txt  | 17 ++++++++++++++++-
 configs/arm_juno_defconfig |  2 +-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
index 52fabf9..9314bb0 100644
--- a/board/arm/juno/readme.txt
+++ b/board/arm/juno/readme.txt
@@ -6,6 +6,7 @@ Intro
 These instructions apply to all models of the ARM Juno:
   - Juno r0 (does not support PCIe)
   - Juno r1 (supports PCIe)
+  - Juno r2 (Big Cluster with A72)
 
 Buildroot will generate the kernel image, device tree blob and a
 minimal root filesystem.
@@ -41,6 +42,7 @@ After building, you should obtain this tree:
     +-- rootfs.tar
     +-- juno.dtb (if Juno r0 is used)
     +-- juno-r1.dtb (if Juno r1 is used)
+    +-- juno-r2.dtb (if Juno r2 is used)
     +-- Image
 
 Preparing your rootfs
@@ -89,6 +91,19 @@ NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 ......
 
+Configure *.dtb in the boot configuration for Juno r2
+=====================================================
+
+SITE1/HBI0262D/images.txt
+......
+NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+NOR3ADDRESS: 0x02000000          ;Image Flash Address
+NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
+NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
+NOR3LOAD: 00000000               ;Image Load Address
+NOR3ENTRY: 00000000              ;Image Entry Point
+......
+
 Installing kernel image and DTB
 ===============================
 
@@ -97,7 +112,7 @@ Installing kernel image and DTB
    A mass storage device should appear in your desktop.
 3. Open the software/ folder
 4. Copy the 'Image' file to software/
-5. Copy the 'juno-r1.dtb' (r1) or the 'juno.dtb' (r0) file to software/
+5. Copy the 'juno-r1.dtb' (r1), 'juno.dtb' (r0) or juno-r2.dtb (r2) file to software/
 6. Press the red button in the front pannel of ARM Juno
 
 At this time, the board will erase the Flash entry for each new item and
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 87b6374..5ce882c 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -11,4 +11,4 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-4.3-2015.11"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
