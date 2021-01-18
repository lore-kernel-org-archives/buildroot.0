From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 18 Jan 2021 21:32:12 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: fix selection of firmware-imx
Message-ID: <20210118203212.5213-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to select firmware-imx we have to select freescale-imx first.

Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4
