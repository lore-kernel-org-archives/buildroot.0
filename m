From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:21:48 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx8qxpmek: kernel build
 needs host-openssl
Message-ID: <20200324200948.59DE5880BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=018e2fff26b45735e4d0ccf5647325e8980cecf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the recent bump of the kernel to 4.19, the kernel configuration
now needs host-openssl to build.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712527

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8qxpmek_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index 1965e0c804..03ecd22ee6 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8qxp-mek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y
 BR2_PACKAGE_FIRMWARE_IMX=y
