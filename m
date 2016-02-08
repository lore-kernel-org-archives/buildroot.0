From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 12:12:42 +0100
Subject: [Buildroot] [git commit] configs/qemu: update arm-vexpress
	instructions for SMP
Message-ID: <20160208111306.6CD7280E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c06ec1e397b1344897ed9a1959d02f76b550982c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can use the vexpress arm defconfig to test SMP features in Qemu.
So document the necessary invocation changes to account for this, in
preparation of the arm nuri defconfig removal.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-vexpress/readme.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 7ca4e89..c7a7607 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -1,8 +1,11 @@
 Run the emulation with:
 
-  qemu-system-arm -M vexpress-a9 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
+  qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.ext2,if=sd,format=raw -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
+If you want to emulate more cores change "-smp 1" to "-smp 2" for
+dual-core or even "smp -4" for a quad-core configuration.
+
 Tested with QEMU 2.3.0
