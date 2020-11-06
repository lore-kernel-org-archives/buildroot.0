From: Fabio Estevam <festevam@gmail.com>
Date: Fri,  6 Nov 2020 10:36:33 -0300
Subject: [Buildroot] [PATCH 1/2] configs/mx6sx_udoo_neo: select host-openssl
 for the Linux kernel build
Message-ID: <20201106133634.15452-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to fix the following
build error:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>

Fixes:
 https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6sx_udoo_neo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 4a2f8b0bc056..2bdcade25296 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.17.1
