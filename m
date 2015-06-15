From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 15 Jun 2015 20:46:03 +0200
Subject: [Buildroot] [PATCH 4/5] cubieboard: rename script to mksunxicard.sh
In-Reply-To: <1434393964-20355-1-git-send-email-francois.perrad@gadz.org>
References: <1434393964-20355-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1434393964-20355-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in order to reuse it for A20-OLinuXino

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/cubietech/cubieboard/{mkcubiecard.sh => mksunxicard.sh} | 4 ++--
 board/cubietech/cubieboard/readme.txt                         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/cubietech/cubieboard/{mkcubiecard.sh => mksunxicard.sh} (97%)

diff --git a/board/cubietech/cubieboard/mkcubiecard.sh b/board/cubietech/cubieboard/mksunxicard.sh
similarity index 97%
rename from board/cubietech/cubieboard/mkcubiecard.sh
rename to board/cubietech/cubieboard/mksunxicard.sh
index f1d5a9f..97e04b5 100755
--- a/board/cubietech/cubieboard/mkcubiecard.sh
+++ b/board/cubietech/cubieboard/mksunxicard.sh
@@ -82,12 +82,12 @@ fi
 if [ -b ${DRIVE}2 ]; then
 	D2=${DRIVE}2
 	umount ${DRIVE}2
-	mkfs.ext4 -L "Cubie" ${DRIVE}2
+	mkfs.ext4 -L "SUNXI" ${DRIVE}2
 else
 	if [ -b ${DRIVE}p2 ]; then
 		D2=${DRIVE}p2
 		umount ${DRIVE}p2
-		mkfs.ext4 -L "Cubie" ${DRIVE}p2
+		mkfs.ext4 -L "SUNXI" ${DRIVE}p2
 	else
 		echo "Cant find rootfs partition in /dev"
 		exit 1
diff --git a/board/cubietech/cubieboard/readme.txt b/board/cubietech/cubieboard/readme.txt
index 81cc5e4..3b542c7 100644
--- a/board/cubietech/cubieboard/readme.txt
+++ b/board/cubietech/cubieboard/readme.txt
@@ -41,7 +41,7 @@ How setting up the SD card
 --------------------------
 
 Depending on the rootfs size, you might want to use a 2GB or larger SD-card.
-The script mkcubiecard.sh will take care of partitioning and formatting
+The script mksunxicard.sh will take care of partitioning and formatting
 the SD-card.
 
 BEWARE! This process will erase your SD card.
@@ -49,7 +49,7 @@ BEWARE! This process will erase your SD card.
 Use dmesg to find out where the SD card is attached in the /dev tree
 (<device>) and then:
 
-# sudo ./mkcubiecard.sh <images_dir> <device>
+# sudo ./mksunxicard.sh <images_dir> <device>
 
 where:
  - <images_dir> is the directory containing the generated files (usually
-- 
2.1.4
