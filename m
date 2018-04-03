From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 12:51:35 +0200
Subject: [Buildroot] [git commit] qemu_ppc64_e5500_defconfig: convert quotes
 in readme.txt emulation example
Message-ID: <20180403105155.A33A3813D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcf5fafe84d054d1bb168f9d72e36fd83ba30a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resolves an error in the way the bootlin toolchain-builder uses
the board/qemu/ppc64-e5500/readme.txt to generate the qemu test
command.

https://github.com/free-electrons/toolchains-builder/blob/master/build.sh#L186

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/ppc64-e5500/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index 0bfd41d76b..a6ad893b4d 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append 'console=ttyS0 root=/dev/vda' -serial mon:stdio -nographic
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 root=/dev/vda" -serial mon:stdio -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
