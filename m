From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:29 +0200
Subject: [Buildroot] [PATCH v4 12/36] stm32f429-disco: replace $HOST_DIR/usr
	with $HOST_DIR in flash script
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-13-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Manual change because the script uses ${OUTPUT_DIR}/host instead of
${HOST_DIR}.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/stmicroelectronics/stm32f429-disco/flash.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
index 74021369a7..b19e0a6019 100755
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
-- 
2.13.2
