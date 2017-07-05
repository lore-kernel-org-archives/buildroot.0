From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:25 +0200
Subject: [Buildroot] [git commit] stm32f469-disco: replace $HOST_DIR/usr
	with $HOST_DIR in flash script
Message-ID: <20170705141335.A809E7FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e9c98a8384a09547c2544df2f3e15c08bae63d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Manual change because the script uses ${OUTPUT_DIR}/host instead of
${HOST_DIR}.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/stmicroelectronics/stm32f469-disco/flash.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
index a68bea0..0ec0beb 100755
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
