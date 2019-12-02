From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 12:47:47 +0100
Subject: [Buildroot] [git commit] board/pc/post-image-efi.sh: fail on any
 error
Message-ID: <20191202114016.8488383885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b1d9f74c7bc86a2a626bd38a98b34c77a6465a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As already done in post-build.sh, to prevent hiding errors.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
