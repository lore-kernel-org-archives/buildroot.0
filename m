From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 10 Mar 2018 17:04:19 +0200
Subject: [Buildroot] [PATCH v3 3/4] odroidc2: prepare post-image.sh for
 multi config support
In-Reply-To: <20180310150420.22364-1-daggs@gmx.com>
References: <20180310150420.22364-1-daggs@gmx.com>
Message-ID: <20180310150420.22364-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

prepare post-image.sh for support addition of multiple buildroot configs

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
no changes made, the patch is resent to make sure it will be applied as
part of the set.

 board/hardkernel/odroidc2/post-image.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
index aaf12c1e79..a53f87ec11 100755
--- a/board/hardkernel/odroidc2/post-image.sh
+++ b/board/hardkernel/odroidc2/post-image.sh
@@ -1,8 +1,11 @@
 #!/bin/sh
 
 BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+IM_FILE=""
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+IM_FILE="${BINARIES_DIR}/u-boot.bin"
 
 cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
 
@@ -15,5 +18,5 @@ genimage                           \
 	--outputpath "${BINARIES_DIR}" \
 	--config "${GENIMAGE_CFG}"
 
-dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
-dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc
+dd if=${IM_FILE} of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
+dd if=${IM_FILE} of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc
-- 
2.16.2
