From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 May 2016 17:33:25 -0300
Subject: [Buildroot] [PATCH] post-image: Do not hardcode the genimage.cfg
	path
Message-ID: <1463171605-15987-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of hardcoding the genimage.cfg path, let's add a BOARD_DIR
variable to improve readability.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6ulevk/post-image.sh | 3 ++-
 board/via/imx6_vab820/post-image.sh     | 3 ++-
 board/wandboard/post-image.sh           | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/board/freescale/imx6ulevk/post-image.sh b/board/freescale/imx6ulevk/post-image.sh
index cb75a47..8757355 100755
--- a/board/freescale/imx6ulevk/post-image.sh
+++ b/board/freescale/imx6ulevk/post-image.sh
@@ -1,6 +1,7 @@
 #!/usr/bin/env bash
 
-GENIMAGE_CFG="board/freescale/imx6ulevk/genimage.cfg"
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
diff --git a/board/via/imx6_vab820/post-image.sh b/board/via/imx6_vab820/post-image.sh
index 8d502a5..00de33b 100755
--- a/board/via/imx6_vab820/post-image.sh
+++ b/board/via/imx6_vab820/post-image.sh
@@ -1,6 +1,7 @@
 #!/bin/bash
 
-GENIMAGE_CFG="board/via/imx6_vab820/genimage.cfg"
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
index 95cbfa4..11f58db 100755
--- a/board/wandboard/post-image.sh
+++ b/board/wandboard/post-image.sh
@@ -1,6 +1,7 @@
 #!/usr/bin/env bash
 
-GENIMAGE_CFG="board/wandboard/genimage.cfg"
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
-- 
1.9.1
