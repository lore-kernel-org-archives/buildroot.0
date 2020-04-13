From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:49:13 +0200
Subject: [Buildroot] [git commit] board/udoo/neo: create boot.scr in
 TARGET_DIR/boot
Message-ID: <20200413193617.831FB8EA6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2306339d1fe8d5ea2d9e17641f78a374f612f45e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason to create boot.scr in board/udoo/neo and later
install it in TARGET_DIR/boot, leaving a stale file behind.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/udoo/neo/post-build.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/udoo/neo/post-build.sh b/board/udoo/neo/post-build.sh
index 43e091c5d7..6ccd87fafd 100755
--- a/board/udoo/neo/post-build.sh
+++ b/board/udoo/neo/post-build.sh
@@ -2,7 +2,6 @@
 
 BOARD_DIR="$(dirname $0)"
 
+install -d -m 755 $TARGET_DIR/boot
 $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
--n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
-
-install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
