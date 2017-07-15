From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Sat, 15 Jul 2017 14:50:31 +0200
Subject: [Buildroot] [PATCH v2 3/4] board/raspberrypi/post-image.sh: add
	option for uart enable
In-Reply-To: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <1500123032-9198-3-git-send-email-erik.stromdahl@gmail.com>
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
Changes v1 -> v2:
  - Fixed bad print in patch 2
  - Fixed commit comment and removed parenthesis in patch 4
    (comment from Ricardo Martincoski)

 board/raspberrypi/post-image.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 6715714..854aba0 100755
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
