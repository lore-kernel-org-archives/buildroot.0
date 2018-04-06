From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:34:16 +0200
Subject: [Buildroot] [git commit] board/atmel: use correct sam-ba binary in
 flasher.sh script
Message-ID: <20180406193448.A543F8699F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1452fe8434c4613d1727034db525c0a9bbc6dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using the install of sam-ba under host/opt directly, use the symlink
created in host/bin.  The side effect of doing this instead allows the correct
sam-ba binary to be used based on the host arch being 32 bit or 64 bit.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/atmel/flasher.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index bbdb199b97..c122760952 100755
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
