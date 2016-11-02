From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:52:30 +0100
Subject: [Buildroot] [git commit] board/lego/ev3: Use ev3dev linux ext for
	ev3dev drivers
Message-ID: <20161102203752.B1B6881914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bd9a3cb45ef4ce59581eb9f9c557cf6ceef09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This uses the ev3dev linux extension to compile the ev3dev drivers for
LEGO MINDSTORMS EV3.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Create-empty-drivers-lego-Kconfig.patch   | 24 ----------------------
 board/lego/ev3/readme.txt                          |  4 ++--
 configs/lego_ev3_defconfig                         |  4 +---
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch b/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
deleted file mode 100644
index 614d53d..0000000
--- a/board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 72c5727488f10160abfadcc77dd9763c4408b5e9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
-Date: Sat, 15 Oct 2016 16:23:31 +0200
-Subject: [PATCH] Create empty drivers/lego/Kconfig
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
----
- drivers/lego/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
- create mode 100644 drivers/lego/Kconfig
-
-diff --git a/drivers/lego/Kconfig b/drivers/lego/Kconfig
-new file mode 100644
-index 0000000..d7cbf4f
---- /dev/null
-+++ b/drivers/lego/Kconfig
-@@ -0,0 +1 @@
-+# Empty Kconfig just to make source from drivers/Kconfig succeed.
--- 
-2.9.3
-
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index c075af5..c40907c 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -4,8 +4,7 @@ Intro
 =====
 
 This is the buildroot basic board support for the Lego Mindstorms EV3
-programmable brick. No support for sensors and drivers is provided for the
-moment.
+programmable brick.
 
 The Lego Mindstorms EV3 brick comprises a Texas Instruments AM1808 SoC, with
 an ARM 926EJ-S main processor running at 300 MHz.
@@ -17,6 +16,7 @@ See:
 The buildroot configuration uses the Linux kernel of the ev3dev project.
 See:
 - https://github.com/ev3dev/ev3-kernel/
+- https://github.com/ev3dev/lego-linux-drivers/
 - http://www.ev3dev.org/
 
 How it works
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index ea76d59..543a227 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,9 +2,6 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
-
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
@@ -20,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
 BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
