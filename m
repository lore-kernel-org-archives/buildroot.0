From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 18:32:20 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/imx-gpu-viv: add
 dependency to BR2_INSTALL_LIBSTDCPP to examples
Message-ID: <20210523160325.365C87FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d62023aea17b429b1d7f14462a54c51a8bc7f43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The examples require libstdc++.so.6 so add the required dependency to
the Config.in.

  ./tiger: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3d78dbace207b6b93416b27abcb85dbccde97a6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cca2689905..633e04883e 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -83,11 +83,17 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	bool "install examples"
+	# example binaries are linked against libstdc++.so.6
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Copy the Vivante examples to the target.
 
 	  Warning: examples take approximately 150 MB of disk space.
 
+comment "imx-gpu-viv-examples need a toolchain w/ C++ support"
+    depends on !BR2_INSTALL_LIBSTDCPP
+
+
 config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
 	bool "install gmem_info tool"
 	help
