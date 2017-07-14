From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Fri, 14 Jul 2017 08:48:50 +0200
Subject: [Buildroot] [PATCH 3/4] board/raspberrypi/post-image.sh: add option
	for uart enable
In-Reply-To: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <1500014931-5599-3-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the uart is enabled only when the --aarch64 option
is passed to post-image.sh.

Since enabling of the uart is unrelated to the ARM architecture
(the same config key is applicable to rpi2 as well),
a new option was introduced.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 board/raspberrypi/post-image.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index be5ed9c..d7824a5 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -28,7 +28,8 @@ __EOF__
 arm_control=0x200
 __EOF__
 		fi
-
+		;;
+		--enable-uart)
 		# Enable uart console
 		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-- 
2.7.4
