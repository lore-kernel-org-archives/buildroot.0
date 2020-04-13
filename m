From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:46:23 +0200
Subject: [Buildroot] [git commit] board/solidrun/mx6cubox: create boot.scr
 in TARGET_DIR/boot
Message-ID: <20200413193617.784138EA6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ddbd11620b5a01945a438085d45ef2131bad35f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason to create boot.scr in board/solidrun/mx6cubox and
later install it in TARGET_DIR/boot, leaving a stale file behind.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/solidrun/mx6cubox/post-build.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/solidrun/mx6cubox/post-build.sh b/board/solidrun/mx6cubox/post-build.sh
index 43e091c5d7..6ddc113702 100755
--- a/board/solidrun/mx6cubox/post-build.sh
+++ b/board/solidrun/mx6cubox/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
--n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+install -d -m 755 $TARGET_DIR/boot
 
-install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
+	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
