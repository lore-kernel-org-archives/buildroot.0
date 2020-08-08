From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:59:32 +0200
Subject: [Buildroot] [git commit branch/next] configs/nitrogen6x: Linux
 needs host-openssl
Message-ID: <20200812144328.D7ACF81255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbdef3e0a5415c6bd5d7b07ce8af9d1b42fdac8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel configuration used for the nitrogen6x defconfig needs
host-openssl.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934098

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen6x_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 9c24dadbc0..01d49bb09c 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -40,3 +40,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6dl-nitrogen6_som2 imx6q-nitrogen6_som2 imx6qp-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
