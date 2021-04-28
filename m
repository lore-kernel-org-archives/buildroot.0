From: Charles Hardin <ckhardin@gmail.com>
Date: Tue, 27 Apr 2021 20:40:36 -0700
Subject: [Buildroot] [PATCH 1/1] package/imx-seco: use the c0 revision for
 the imx8qxp ahab image
Message-ID: <20210428034036.15461-1-charles.hardin@chargepoint.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <ckhardin@gmail.com>

The silicon revision for the imx8 is C0 and this is the release
candidate for the new update images. It also seems to work on
some B0 early silicon in addition, so change the ahab container
to use mx8qxc0-ahab-container.img

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 package/freescale-imx/imx-seco/imx-seco.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 245c3e3311..711315ea93 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -22,7 +22,7 @@ IMX_SECO_INSTALL_IMAGES = YES
 # is done in post-image script.
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 define IMX_SECO_INSTALL_IMAGES_CMDS
-	cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
+	cp $(@D)/firmware/seco/mx8qxc0-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
-- 
2.21.1 (Apple Git-122.3)
