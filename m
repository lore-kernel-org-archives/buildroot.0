From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:24 +0200
Subject: [Buildroot] [git commit] stm32f429-disco: replace $HOST_DIR/usr
	with $HOST_DIR in flash script
Message-ID: <20170705141335.8ABB781D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dc8e8a97b2b20601640c552a5dd40b08f4b44bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Manual change because the script uses ${OUTPUT_DIR}/host instead of
${HOST_DIR}.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/stmicroelectronics/stm32f429-disco/flash.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
index 7402136..b19e0a6 100755
--- a/board/stmicroelectronics/stm32f429-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
@@ -14,7 +14,7 @@ if ! test -d "${OUTPUT_DIR}" ; then
     exit 1
 fi
 
-${OUTPUT_DIR}/host/usr/bin/openocd -f board/${BOARD_NAME}.cfg \
+${OUTPUT_DIR}/host/bin/openocd -f board/${BOARD_NAME}.cfg \
   -c "init" \
   -c "reset init" \
   -c "flash probe 0" \
