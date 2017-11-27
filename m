From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:37:34 +0100
Subject: [Buildroot] [git commit] board/qemu/x86*: use quotes around -append
 Qemu option value
Message-ID: <20171127213014.1BE9B7FB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c191e24c33f3faf208527f523935d891b00cf282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This helps the toolchains.free-electrons.com build logic re-use
directly the Qemu command lines from this readme.txt file, by having a
-append option similar to the ones used in other readme.txt files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/readme.txt    | 2 +-
 board/qemu/x86_64/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 1750096..b003ad5 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index ecd7813..ed7b5f5 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
