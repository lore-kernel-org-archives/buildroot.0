From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 5 Apr 2018 14:34:41 -0700
Subject: [Buildroot] [PATCH] board/atmel: use correct sam-ba binary in
 flasher.sh script
Message-ID: <1522964081-1235-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using the install of sam-ba under host/opt directly, use the symlink
created in host/bin.  The side effect of doing this instead allows the correct
sam-ba binary to be used based on the host arch being 32 bit or 64 bit.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 board/atmel/flasher.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index bbdb199..c122760 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -130,7 +130,6 @@ if [[ $BOARD == "*pda4" ]]; then
 	video_mode="video=LVDS-1:480x272-16"
 fi
 
-echo "Executing: ${!F} O=$1/images $1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode"
+echo "Executing: ${!F} O=$1/images $1/host/bin/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode"
 export O=$1/images
-$1/host/opt/sam-ba/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode
-
+$1/host/bin/sam-ba $TTY ${!M} $(dirname $0)/nandflash.tcl -- ${!F} ${!D} $video_mode
-- 
2.7.4
