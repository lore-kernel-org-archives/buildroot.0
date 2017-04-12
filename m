From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:04 +0200
Subject: [Buildroot] [PATCH 30/53] stm32f469-disco: replace $HOST_DIR/usr
	with $HOST_DIR in flash script
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-31-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Manual change because the script uses ${OUTPUT_DIR}/host instead of
${HOST_DIR}.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/stmicroelectronics/stm32f469-disco/flash.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
index a68bea09a7..0ec0beb2de 100755
--- a/board/stmicroelectronics/stm32f469-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
@@ -8,7 +8,7 @@ if ! test -d "${OUTPUT_DIR}" ; then
     exit 1
 fi
 
-${OUTPUT_DIR}/host/usr/bin/openocd -f board/stm32f469discovery.cfg \
+${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
   -c "init" \
   -c "reset init" \
   -c "flash probe 0" \
-- 
2.11.0
