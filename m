From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:00:47 +0100
Subject: [Buildroot] [git commit] nitrogen6x: use install instead of cp
Message-ID: <20141201104837.471E17FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04576d9e55341bb7701d70f25d8cf2c276360acd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

in order to not depend on the previous permissions of each file

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/nitrogen6x/post-build.sh |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index cc6e66a..2b43aa3 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -8,11 +8,11 @@
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-cp $BOARD_DIR/6x_bootscript $TARGET_DIR
+install -D -m 0644 $BOARD_DIR/6x_bootscript $TARGET_DIR/6x_bootscript
 
 # u-boot / update script for bd upgradeu command
 if [ -e $BINARIES_DIR/u-boot.imx ];
 then
-    cp $BINARIES_DIR/u-boot.imx $TARGET_DIR
-    cp $BOARD_DIR/6x_upgrade $TARGET_DIR
+    install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
+    install -D -m 0644 $BOARD_DIR/6x_upgrade $TARGET_DIR/6x_upgrade
 fi
