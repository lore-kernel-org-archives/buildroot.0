From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:01:38 +0100
Subject: [Buildroot] [git commit] imx6slevk: fix uImage load address
Message-ID: <20150201211956.3827F8043A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd02d3857dbf7e47dbab420b9e2e6676a1be30a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i.MX6 SoloLite SoC has a different external memory base address
than the other i.MX6 family SoCs:
- 0x80000000 for i.MX6 SoloLite (see i.MX6 SoloLite Reference Manual [1])
- 0x10000000 for the others (see i.MX6Quad/Dual Reference Manual [2])

[1] http://cache.freescale.com/files/32bit/doc/ref_manual/IMX6SLRM.pdf?fasp=1
    Table 2-1 System Memory Map, MMDC - DDR Controller
[2] http://cache.freescale.com/files/32bit/doc/ref_manual/IMX6DQRM.pdf?fasp=1
    Table 2-1 System Memory Map, MMDC - DDR Controller

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6sololiteevk_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index f8ecc7b..2bb47af 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -11,7 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
