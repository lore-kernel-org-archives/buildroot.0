From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:03:26 +0200
Subject: [Buildroot] [git commit] configs/olpc_xo1: enable JFFS2 image
Message-ID: <20200617190503.5C250814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3b17496dea988054ffaabce17e4a132efc69a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The machine has a NAND flash device and firmware capable of loading the
OS from a JFFS2 file system on it. Enable creation of JFFS2 image that
can be written to said flash device.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olpc_xo1_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 5919f6ab36..800e5226e7 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -21,4 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_LABEL="XO1"
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O dir_index,^huge_file,^64bit,^extent"
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
+BR2_TARGET_ROOTFS_JFFS2_PAD=y
 BR2_PACKAGE_HOST_GENIMAGE=y
