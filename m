From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  2 Apr 2018 19:43:25 -0500
Subject: [Buildroot] [PATCH] qemu_ppc64_e5500_defconfig: convert quotes in
 readme.txt emulation example
Message-ID: <1522716205-65432-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resolves an error in the way the bootlin toolchain-builder uses
the board/qemu/ppc64-e5500/readme.txt to generate the qemu test
command.

https://github.com/free-electrons/toolchains-builder/blob/master/build.sh#L186

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 board/qemu/ppc64-e5500/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index 0bfd41d..a6ad893 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append 'console=ttyS0 root=/dev/vda' -serial mon:stdio -nographic
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 root=/dev/vda" -serial mon:stdio -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-- 
1.9.1
