From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 13:49:19 +0200
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: pin kernel
 version to 5.9
Message-ID: <20201015113802.2BFD381F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90e9d953ec62c6f40344881d07805f2787c5602c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a fixed kernel version to have a reproducible and tested
configuration.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/kontron_smarc_sal28_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 53cb776a58..d4b2387e34 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
@@ -7,6 +8,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
