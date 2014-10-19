From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Oct 2014 23:53:42 +0200
Subject: [Buildroot] [git commit] imx-vpu: add VPU firmware selection
Message-ID: <20141019215409.4DBB1AFE2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81085028cc01f372fdb75a79eb2ca9634e6aa917
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the imx-vpu package needs the firmware to be loaded into the VPU it
makes sense to have the latter package selected by default.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-vpu/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
index cf5ab5f..8a95416 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IMX_VPU
 	bool "imx-vpu"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Library of userspace helpers specific for the Freescale i.MX
 	  platform. It wraps the kernel interfaces for the i.MX platform
