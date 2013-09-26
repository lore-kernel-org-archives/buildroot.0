From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 21:11:14 +0200
Subject: [Buildroot] [git commit] nitrogen6x: use 6x_bootscript/6x_upgrade
	instead of older 6q_ versions
Message-ID: <20130926193801.666429B7B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c149850baa1286ea04b812acc1443895d878b04b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/boundarydevices/nitrogen6x/6q_bootscript     |  Bin 455 -> 0 bytes
 board/boundarydevices/nitrogen6x/6x_bootscript     |  Bin 0 -> 1653 bytes
 .../nitrogen6x/{6q_upgrade => 6x_upgrade}          |  Bin 1587 -> 1744 bytes
 board/boundarydevices/nitrogen6x/post-build.sh     |   14 ++++++++------
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6q_bootscript b/board/boundarydevices/nitrogen6x/6q_bootscript
deleted file mode 100644
index e10cfeb..0000000
Binary files a/board/boundarydevices/nitrogen6x/6q_bootscript and /dev/null differ
diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript b/board/boundarydevices/nitrogen6x/6x_bootscript
new file mode 100644
index 0000000..dc9eea4
Binary files /dev/null and b/board/boundarydevices/nitrogen6x/6x_bootscript differ
diff --git a/board/boundarydevices/nitrogen6x/6q_upgrade b/board/boundarydevices/nitrogen6x/6x_upgrade
similarity index 59%
rename from board/boundarydevices/nitrogen6x/6q_upgrade
rename to board/boundarydevices/nitrogen6x/6x_upgrade
index 2f20efa..cd26b61 100644
Binary files a/board/boundarydevices/nitrogen6x/6q_upgrade and b/board/boundarydevices/nitrogen6x/6x_upgrade differ
diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
index 2f3c464..1dc5643 100755
--- a/board/boundarydevices/nitrogen6x/post-build.sh
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -1,18 +1,20 @@
 #!/bin/sh
 # post-build fixups
-# for furthe details, see
-# http://boundarydevices.com/u-boot-conventions-for-i-mx6-nitrogen6x-and-sabrelite/
+# for further details, see
+#
+#  http://boundarydevices.com/u-boot-on-i-mx6/
+#
 
 TARGET_DIR=$1
 IMAGES_DIR=$1/../images
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-cp $BOARD_DIR/6q_bootscript $TARGET_DIR
+cp $BOARD_DIR/6x_bootscript $TARGET_DIR
 
 # u-boot / update script for bd upgradeu command
-if [ -e $IMAGES_DIR/u-boot.bin ];
+if [ -e $IMAGES_DIR/u-boot.imx ];
 then
-    cp $IMAGES_DIR/u-boot.bin $TARGET_DIR
-    cp $BOARD_DIR/6q_upgrade $TARGET_DIR
+    cp $IMAGES_DIR/u-boot.imx $TARGET_DIR
+    cp $BOARD_DIR/6x_upgrade $TARGET_DIR
 fi
