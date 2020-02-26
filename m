From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:27:59 +0100
Subject: [Buildroot] [git commit] board/freescale: use correct
 ahab-container.img file name
Message-ID: <20200226211558.63C808EB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=538940be388842d5ed3bdddaa6a5e56b34257db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3f8ace002831a01ed6aec59b704bd92c8a3b957f
("board/freescale/common/imx: add support for i.MX8") had its
conflicts incorrectly tweaked when applied to Buildroot. The
ahab-container.img is installed with this name (ahab-container.img) by
the imx-firmware package, and not mx8qm-ahab-container.img or
mx8qx-ahab-container.img.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Julien Olivain <juju@cotds.org>
Tested-by: Julien Olivain <juju@cotds.org>
Reported-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 302fd00658..45c648e360 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -28,9 +28,9 @@ main ()
 		cp ${BINARIES_DIR}/bl31.bin ${BINARIES_DIR}/u-boot-atf.bin
 		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
 		if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
-			${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/mx8qm-ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+			${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		else
-			${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/mx8qx-ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+			${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		fi
 	fi
 
