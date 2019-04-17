From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 22:46:39 +0200
Subject: [Buildroot] [git commit] configs/freescale_t2080_qds_rdb_defconfig:
 new board
Message-ID: <20190417204710.A7E988A58E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfb5a7a3c1b9fc68ce77fa67fefbda17444598c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The board is setup to track upstream Linux as the official
vendor support was complete(depricated) at 4.1 via NXP SDKs.

The target does not build uboot and assumes the user still uses the NXP
suggested prebuilts in the SDK2.0 (last release for PowerPC). If a
uboot is required, the source for SDK2.0 can be found in the following
repo.
http://git.freescale.com/git/cgit.cgi/ppc/sdk/u-boot.git/tag/?id=fsl-sdk-v2.0-1703

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: update .gitlab-ci.yml]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                            |  1 +
 configs/freescale_t2080_qds_rdb_defconfig | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 424e7e43af..e9869be784 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -148,6 +148,7 @@ freescale_imx8mqevk_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
 freescale_t1040d4rdb_defconfig: { extends: .defconfig }
+freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_a64_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
 galileo_defconfig: { extends: .defconfig }
diff --git a/configs/freescale_t2080_qds_rdb_defconfig b/configs/freescale_t2080_qds_rdb_defconfig
new file mode 100644
index 0000000000..3d03c32f7e
--- /dev/null
+++ b/configs/freescale_t2080_qds_rdb_defconfig
@@ -0,0 +1,25 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_e6500=y
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.14"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t2080qds fsl/t2080rdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
