From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:11:15 +0200
Subject: [Buildroot] [git commit] nitrogen6x: include .dtb files for
	compatible variants
Message-ID: <20140715211145.1FC0C9D24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ba15d96244656163198c3a215bd44a68b3cd62f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Boundary Devices Nitrogen6X comes in a number of variants
with different processors, and the kernel and userspace is
compatible with the SABRE Lite (BD-SL-i.MX6), Nitrogen6_Lite,
and Nitrogen6_Max boards.

This patch adds support for these boards through the
corresponding .dtb files.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6x_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index da2a7e8..082b1f5 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -26,4 +26,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-nitrogen6x"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_max imx6dl-nitrogen6x imx6q-nitrogen6_max imx6q-nitrogen6x imx6q-sabrelite"
