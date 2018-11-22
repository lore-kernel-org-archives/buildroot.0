From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 10:41:44 +0100
Subject: [Buildroot] [PATCH 1/6] configs/imx6-sabresd_qt5: add missing
 dependency on host-openssl
Message-ID: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-openssl is needed to build the Linux kernel. This is the same
issue that was fixed in commit
5dac3b9b8d72ea2b4aa264bfaa54e41f32595009 ("configs/imx6-sabresd: needs
host-openssl for the Linux kernel build") for the minimal defconfig
for the same board.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771070

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 7457af3135..2534d5cb87 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -43,6 +43,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # GL driver
 BR2_PACKAGE_MESA3D=y
-- 
2.19.1
