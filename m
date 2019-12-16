From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 11:01:49 +0100
Subject: [Buildroot] [git commit] board/pc/post-build.sh: fix typo in grub
 boot.img path
Message-ID: <20191216095348.D3D748B632@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afcdf9f5c5bdbdaa21d79d2eb9fd6953e0877611
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3468ef16fa55610bae3bacefaf816231a20cfab0
("configs/pc_x86_64_efi: use genimage GPT partition table support")
had a small typo on the path to grub boot.img file: i387-pc instead of
i386-pc, which causes a build failure.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314412

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index 552d488160..ed37b3b87e 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -11,5 +11,5 @@ else
     cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
 
     # Copy grub 1st stage to binaries, required for genimage
-    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
+    cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
 fi
