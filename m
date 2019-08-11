From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Sun, 11 Aug 2019 16:58:54 +0200
Subject: [Buildroot] [PATCH 2/4] board/acmesystems/aria-g25: update
 genimage.cfg and delete post-image.sh
In-Reply-To: <20190811145856.27420-1-biagio.hkr@gmail.com>
References: <20190811145856.27420-1-biagio.hkr@gmail.com>
Message-ID: <20190811145856.27420-2-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update name of the AT91bootstrap output file since it has been
  updated to v3.8.13
* Remove post-image.sh since we now use the default one provided
  by Buildroot (support/scripts/genimage.sh)

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/aria-g25/genimage.cfg  |  2 +-
 board/acmesystems/aria-g25/post-image.sh | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100755 board/acmesystems/aria-g25/post-image.sh

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
index 2e2eb129aa..b40ad9edf3 100644
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 
 		file boot.bin {
-			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.6.bin"
+			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bin"
 		}
 	}
 	size = 16M
diff --git a/board/acmesystems/aria-g25/post-image.sh b/board/acmesystems/aria-g25/post-image.sh
deleted file mode 100755
index 2846f56d72..0000000000
--- a/board/acmesystems/aria-g25/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage  \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-- 
2.17.1
