From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon,  2 Dec 2019 08:18:59 -0300
Subject: [Buildroot] [PATCH] board/pc/post-image-efi.sh: fail on any error
Message-ID: <20191202111859.8874-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

As alredy done in post-build.sh, to prevent hiding errors.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 board/pc/post-image-efi.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/pc/post-image-efi.sh b/board/pc/post-image-efi.sh
index 178565f18b..a0df70a6ab 100755
--- a/board/pc/post-image-efi.sh
+++ b/board/pc/post-image-efi.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+set -e
+
 UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
 sed -i "s/UUID_TMP/$UUID/g" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
 sed "s/UUID_TMP/$UUID/g" board/pc/genimage-efi.cfg > "$BINARIES_DIR/genimage-efi.cfg"
-- 
2.18.1
