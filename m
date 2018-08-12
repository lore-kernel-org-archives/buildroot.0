From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 16:13:22 +0200
Subject: [Buildroot] [git commit] configs/snps_archs38_vdk: use post-build
 script instead of overlay
Message-ID: <20180812140814.2F78C8C557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9707ac5840df8bd707a3fad9894441c34c2cf79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 2cdfa6c84951b25e805d329cb7bae833d333538f ("synopsys/axs10x:
Update /etc/inittab by post-build"), two Synopsys platforms were
changed to use a post-build script adding an extra getty in the
inittab instead of a rootfs overlay containing a custom
inittab. However, in this commit, configs/snps_archs38_vdk_defconfig
was not changed, even though it was using the same rootfs overlay.

This commit therefore adjusts configs/snps_archs38_vdk_defconfig to
also use the newly introduced post-build script, fixing the build of
configs/snps_archs38_vdk_defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/88314952

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/snps_archs38_vdk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 129e3267e5..f8766cff8a 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -5,7 +5,7 @@ BR2_archs38=y
 # System
 BR2_TARGET_GENERIC_HOSTNAME="archs38_vdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
-BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
 # Linux headers same as kernel, a 4.16 series
