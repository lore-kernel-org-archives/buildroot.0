From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 14:25:44 +0200
Subject: [Buildroot] [git commit] configs/engicam_imx6qdl_icore_defconfig:
	add missing tools
Message-ID: <20170624122500.14D7781DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a608dab6c61b6b3554977064dd4f700617ca05c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A VFAT filesystem is described in the genimage configuration file, so
we need host-dosfstools and host-mtools enabled in the defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/engicam_imx6qdl_icore_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index e0d89fa..17acdf5 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -36,6 +36,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/genimage.cfg"
