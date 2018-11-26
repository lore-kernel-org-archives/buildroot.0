From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:59:50 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] configs/imx6-sabresd_qt5:
 add missing dependency on host-openssl
Message-ID: <20181126165851.86CAB887E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=743df43a35ab87cd115bddefa0cec0e1fdeeb8bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

host-openssl is needed to build the Linux kernel. This is the same
issue that was fixed in commit
5dac3b9b8d72ea2b4aa264bfaa54e41f32595009 ("configs/imx6-sabresd: needs
host-openssl for the Linux kernel build") for the minimal defconfig
for the same board.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771070

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c32608ba39ebd07dc992bde1380077d5c65a9870)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 8e6065db5b..6e178eed56 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -43,6 +43,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # GL driver
 BR2_PACKAGE_MESA3D=y
