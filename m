From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Oct 2019 15:20:15 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Add openssl for kernel
 build
Message-ID: <20191026182015.9114-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL in order to fix
the following build error:

scripts/Makefile.host:90: recipe for target 'scripts/extract-cert' failed
make[2]: *** [scripts/extract-cert] Error 1
make[2]: *** Waiting for unfinished jobs....

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/332655822

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index aa8667835c..a77b57e4f9 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -37,3 +37,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.17.1
