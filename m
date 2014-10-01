From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  1 Oct 2014 17:03:45 +0200
Subject: [Buildroot] [PATCH v2 2/3] freescale/imx6-sabresd: lock down kernel
	headers to the kernel version
In-Reply-To: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1412175826-9010-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current defconfigs for iMX6 SABRESD kernel 3.10.17 from the Freescale
git repository. This kernel is older than the toolchain kernel headers
used in Buildroot (currently 3.16.3).

Explicitly lock down the kernel headers to match the version of the kernel
that is built.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6dlsabresd_defconfig | 5 +++++
 configs/freescale_imx6qsabresd_defconfig  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index b8c4b22..680031d 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -5,6 +5,11 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
 
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 40a9384..f2f702e 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -5,6 +5,11 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
 
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
-- 
1.9.1
