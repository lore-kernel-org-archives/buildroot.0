From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 24 Nov 2020 21:30:20 +0100
Subject: [Buildroot] [PATCHv4 2/4] board/qemu/post-image.sh: rename
 IMAGE_DIR to BINARIES_DIR
In-Reply-To: <20201124203022.477461-1-romain.naour@gmail.com>
References: <20201124203022.477461-1-romain.naour@gmail.com>
Message-ID: <20201124203022.477461-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output/images directory is called BINARIES_DIR in the
Buildroot manual, not IMAGE_DIR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 9a4d216274..f34bf5043a 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -19,9 +19,9 @@ if [ -z "${QEMU_CMD_LINE}" ]; then
     exit 0
 fi
 
-# Replace output/images path by ${IMAGE_DIR} since the script
+# Replace output/images path by ${BINARIES_DIR} since the script
 # will be in the same directory as the kernel and the rootfs images.
-QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}"
+QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images/\${BINARIES_DIR\}}"
 
 # Remove -serial stdio if present, keep it as default args
 DEFAULT_ARGS="$(sed -r -e '/-serial stdio/!d; s/.*(-serial stdio).*/\1/' <<<"${QEMU_CMD_LINE}")"
@@ -40,7 +40,7 @@ esac
 
 cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
 	#!/bin/sh
-	IMAGE_DIR="\${0%/*}/"
+	BINARIES_DIR="\${0%/*}/"
 
 	if [ "\${1}" = "serial-only" ]; then
 	    EXTRA_ARGS='${SERIAL_ARGS}'
-- 
2.25.4
