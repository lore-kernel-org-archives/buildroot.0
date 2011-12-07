From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 16:54:41 +0100
Subject: [Buildroot] [git commit] qemu/arm-versatile: readme: enable
	ethernet emulation
Message-ID: <20111207193832.979508F76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07225ca919c3ac75245b3003b3fb14eb57d39a09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We build the kernel with smc91x support, so also document how to enable
the emulation of it in qemu.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/arm-versatile/readme.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 834b0e0..2ca5dec 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
