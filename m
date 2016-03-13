From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 22:54:27 +0100
Subject: [Buildroot] [git commit] configs: cubieboard2: correct genimage
	dependencies
Message-ID: <20160313220628.7459E81861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ade33ca5ae759e865c46e3879f348f3dc0e79a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The genimage configuration creates a vfat filesystem, so ensure we have
dosfstools / mtools built for the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/cubieboard2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 9511cba..a68c507 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -25,5 +25,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
