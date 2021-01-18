From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:12:58 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix selection of
 firmware-imx
Message-ID: <20210118205558.C31F387120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e2d5aa2d6320f0b20eda629f5ad6cf8db377bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to select firmware-imx we have to select freescale-imx first.

Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index a322d18cb3..7c87f3de38 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -149,6 +149,7 @@ comment "Legacy options removed in 2021.02"
 config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
 	bool "imx sdma firmware is provided by firmware-imx"
 	select BR2_LEGACY
+	select BR2_PACKAGE_FREESCALE_IMX
 	select BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  linux-firmware provide the same firmware as firmware-imx.
