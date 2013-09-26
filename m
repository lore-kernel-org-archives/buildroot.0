From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 21:15:59 +0200
Subject: [Buildroot] [git commit] nitrogen6x: post-build.sh: use the
	exported variables for {TARGET, BINARIES}_DIR
Message-ID: <20130926193801.7C9669B7B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b720a014bba13818c33810a9673b36d2114055a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but lets show the preferred way to do this.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/boundarydevices/nitrogen6x/post-build.sh |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index 1dc5643..cc6e66a 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -5,16 +5,14 @@
 #  http://boundarydevices.com/u-boot-on-i-mx6/
 #
 
-TARGET_DIR=$1
-IMAGES_DIR=$1/../images
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
 cp $BOARD_DIR/6x_bootscript $TARGET_DIR
 
 # u-boot / update script for bd upgradeu command
-if [ -e $IMAGES_DIR/u-boot.imx ];
+if [ -e $BINARIES_DIR/u-boot.imx ];
 then
-    cp $IMAGES_DIR/u-boot.imx $TARGET_DIR
+    cp $BINARIES_DIR/u-boot.imx $TARGET_DIR
     cp $BOARD_DIR/6x_upgrade $TARGET_DIR
 fi
