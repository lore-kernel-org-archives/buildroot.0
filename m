From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 09:08:14 +0100
Subject: [Buildroot] [PATCH 1/2] board/qemu/ppc64-pseries: adjust Qemu
 command line
Message-ID: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helps the toolchains.free-electrons.com build logic re-use
directly the Qemu command lines from this readme.txt file, by having a
-append option similar to the ones used in other readme.txt files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/ppc64-pseries/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 7cc0c67d61..9de13779d0 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append 'console=hvc0 root=/dev/sda' -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
+ qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append "console=hvc0 root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
 
 The login prompt will appear in the terminal that started Qemu.
 
-- 
2.13.6
