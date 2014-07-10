From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 10 Jul 2014 10:18:04 -0700
Subject: [Buildroot] [PATCH] nitrogen6x: include .dtb files for compatible
	variants
In-Reply-To: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>
References: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Boundary Devices Nitrogen6X comes in a number of variants
with different processors, and the kernel and userspace is
compatible with the SABRE Lite (BD-SL-i.MX6), Nitrogen6_Lite,
and Nitrogen6_Max boards.

This patch adds support for these boards through the
corresponding .dtb files.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 configs/nitrogen6x_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index da2a7e8..04db23a 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -26,4 +26,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-nitrogen6x"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_max imx6dl-nitrogen6x imx6q-nitrogen6_max imx6q-nitrogen6x imx6q-sabrelite"
-- 
1.9.1
