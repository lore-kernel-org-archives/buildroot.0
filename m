From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:05:18 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: fix
 the ahab-container name
Message-ID: <20191222125631.65B317FEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=571b8ca09563ffa97a1d0df2fa076530426ab8da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the firmware-imx bump to version 8.1.1 the following
error is observed when building freescale_imx8qxpmek_defconfig:

>> firmware-imx 8.1.1 Installing to images directory
cp /home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img
/home/fabio/buildroot/output/images/ahab-container.img
cp: cannot stat
'/home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img':
No such file or directory

In the firmware-imx-8.1.1 (and newer) the i.MX8QXP container image was
renamed to mx8qx-ahab-container.img, so fix it accordingly.

Fixes: 3ec818769d51 ("package/freescale-imx/firmware-imx: bump version to 8.1.1")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 59af3f9b96..c9040e1853 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -50,7 +50,7 @@ FIRMWARE_IMX_INSTALL_IMAGES = YES
 define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	# SECO firmware is needed when generating imx8-boot-sd.bin which
 	# is done in post-image script.
-	cp $(@D)/firmware/seco/ahab-container.img \
+	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
 else
