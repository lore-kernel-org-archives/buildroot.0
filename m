From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jun 2011 00:20:41 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for sheevaplug
Message-ID: <20110621222124.4937388D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da7d572897b82b8ae2044e64835895233844f66c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://en.wikipedia.org/wiki/SheevaPlug

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/sheevaplug_defconfig |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 configs/sheevaplug_defconfig

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
new file mode 100644
index 0000000..757e1f5
--- /dev/null
+++ b/configs/sheevaplug_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# filesystem
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
+BR2_TARGET_UBOOT_FORMAT_KWB=y
+# BR2_TARGET_UBOOT_NETWORK is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.1"
+BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
+BR2_LINUX_KERNEL_UIMAGE=y
-- 
1.7.3.4
