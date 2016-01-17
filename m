From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2016 22:55:25 +0100
Subject: [Buildroot] [git commit] configs/orangepipc: add host-dosfstools
Message-ID: <20160117220214.6208480172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54acbe90fef0e7713792c26e86bb367db0f7ec8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genimage from the post-image script needs mkdosfs to create fat partition:

>>>   Executing post-image script board/orangepi/orangepipc/post-image.sh
sh: 1: mkdosfs: not found
vfat(boot.vfat): failed to generate boot.vfat

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepipc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index f39ea43..1dea4c8 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -27,5 +27,6 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4832e17787acb29734d895751bc7a594908aecc6"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
