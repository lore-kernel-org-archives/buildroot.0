From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 22:20:30 +0200
Subject: [Buildroot] [git commit] imx-uuc: uses fork(), needs MMU
Message-ID: <20160819202113.699CA81911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52307f7b4298794e75dff39dde0557a26eae508d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imx-uuc source code uses fork(), so it can only be compiled and used
on MMU-capable platforms. This commit adds the necessary Config.in
dependencies to express this.

Fixes:

  http://autobuild.buildroot.net/results/41602c20d4e6a833e72b507792a28b8db74a5f53/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-uuc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
index d181575..ed734ad 100644
--- a/package/freescale-imx/imx-uuc/Config.in
+++ b/package/freescale-imx/imx-uuc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IMX_UUC
 	bool "imx-uuc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_HOST_DOSFSTOOLS
 	help
 	  This package provides the Universal Adapter user-space
@@ -16,4 +17,5 @@ config BR2_PACKAGE_IMX_UUC
 
 comment "imx-uuc needs a toolchain w/ threads"
 	depends on BR2_arm
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
