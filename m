From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:36:09 +0200
Subject: [Buildroot] [git commit branch/next] post-image: Do not hardcode
	the genimage.cfg path
Message-ID: <20160513203616.A2FC381979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35a24c6f0f2592cd94b1ac293ce62d9a22f2a8b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of hardcoding the genimage.cfg path, let's add a BOARD_DIR
variable to improve readability.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
