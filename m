From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Mar 2018 15:36:53 +0100
Subject: [Buildroot] [PATCH 3/3] board/qemu/ppc64le-pseries: make Qemu
 command similar to ppc64-pseries
In-Reply-To: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
References: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180303143653.16934-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular:

 - Explicitly specify the CPU to be used, POWER8, which matches
   qemu_ppc64le_pseries_defconfig

 - Use hard disk emulation to access the root filesystem instead of an
   initrd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64le-pseries/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 0fdb389828..95455e9478 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M pseries -nographic -kernel output/images/vmlinux -initrd output/images/rootfs.ext2
+qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -append "console=hvc0 root=/dev/sda" -drive file=output/images/rootfs.ext2,if=scsi,index=0,format=raw -serial stdio -display curses
 
 The login prompt will appear in the terminal window.
 
-- 
2.14.3
