From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Jun 2020 15:06:32 +0200
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/firmware-imx: install
 easrc firmware for i.MX8MN
In-Reply-To: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200615130633.19909-2-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On i.MX8MN, the easrc driver needs a firmware in /lib/firmwareimx/easrc/
so install it.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 725f275948..49fda89f28 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -13,6 +13,9 @@ FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_BLOBS = sdma epdc
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+FIRMWARE_IMX_BLOBS += easrc
+endif
 
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
-- 
2.26.2
