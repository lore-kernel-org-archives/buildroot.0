From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:06 -0300
Subject: [Buildroot] [PATCH v4 7/9] nitrogen6x: use install instead of cp
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-8-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in order to not depend on the previous permissions of each file

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 board/boundarydevices/nitrogen6x/post-build.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.1.3
