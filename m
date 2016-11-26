From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 26 Nov 2016 09:42:58 +0100
Subject: [Buildroot] [PATCH] qemu-ppc: fixup wrong startup example,
 use either -hda or -drive
Message-ID: <20161126084257.GA22440@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 While playing with musl+ppc I recognized this.
 Musl-PPC with gcc 5.x is broken, as the gcc patches are incomplete.
 gcc 6.x works with the qemu samples, so maybe disable gcc 5.x for
 musl ppc?
---
 board/qemu/ppc-g3beige/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 070fcbb..3bd88a6 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
-- 
2.1.4
