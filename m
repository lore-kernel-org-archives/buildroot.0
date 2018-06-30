From: J. Tang <tang@jtang.org>
Date: Sat, 30 Jun 2018 15:14:25 -0400
Subject: [Buildroot] [PATCH] raspberrypi3: post-image.sh update 64-bit option
Message-ID: <C163C8A5-70D5-4EE3-8177-4296770198D5@jtang.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As per latest Raspberry Pi firmware documentation, the option
'arm_control' has been deprecated in favor of 'arm_64bit'.

Fixes #11111.

Signed-off-by: Jason Tang <tang@jtang.org>
---
 board/raspberrypi/post-image.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 3c6c938407..70447cd48b 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -23,11 +23,11 @@ __EOF__
 		--aarch64)
 		# Run a 64bits kernel (armv8)
 		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
 # enable 64bits support
-arm_control=0x200
+arm_64bit=1
 __EOF__
 		fi
 
-- 
2.11.0
