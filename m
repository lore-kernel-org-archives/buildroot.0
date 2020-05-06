From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:00:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] board/udoo/neo: create
 boot.scr in TARGET_DIR/boot
Message-ID: <20200506051931.252908D59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52bfa18f8fd112ef1f9adef2e3941f2214cbe52c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

There is no reason to create boot.scr in board/udoo/neo and later
install it in TARGET_DIR/boot, leaving a stale file behind.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2306339d1fe8d5ea2d9e17641f78a374f612f45e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
