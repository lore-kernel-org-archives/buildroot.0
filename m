From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 20 May 2021 08:54:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: add dependency to
 BR2_INSTALL_LIBSTDCPP to examples
Message-ID: <20210520065428.16860-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The examples require libstdc++.so.6 so add the required dependency to
the Config.in.

  ./tiger: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 6668ee8bb5..ca46c5036f 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -84,11 +84,17 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 
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
-- 
2.30.0
