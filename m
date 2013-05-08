From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 15:39:49 +0200
Subject: [Buildroot] [git commit] configs: add basic defconfig for
	openblocks a6
Message-ID: <20130508134103.DFEFA99FB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ebfb350a4cca7fc74b8efbbc262fd7d48d09cb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see http://openblocks.plathome.com/products/a6/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/openblocks_a6_defconfig |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
new file mode 100644
index 0000000..98017ad
--- /dev/null
+++ b/configs/openblocks_a6_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# system
+BR2_TARGET_GENERIC_HOSTNAME="openblocks-a6"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# filesystem
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-openblocks_a6"
