From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:07:01 +0200
Subject: [Buildroot] [git commit] board/raspberrypi: update firmware option
 to use 64-bit mode
Message-ID: <20180630200359.5C441838D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722c11ce7b25a1925498483ef58f59d0931b2ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As per latest Raspberry Pi firmware documentation, the option
'arm_control' has been deprecated in favor of 'arm_64bit'.

Fixes https://bugs.busybox.net/show_bug.cgi?id=11111.

Signed-off-by: Jason Tang <tang@jtang.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
