From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 09:08:15 +0100
Subject: [Buildroot] [PATCH 2/2] board/qemu/x86*: use quotes around -append
 Qemu option value
In-Reply-To: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
References: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171121080815.31347-2-thomas.petazzoni@free-electrons.com>
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
 board/qemu/x86/readme.txt    | 2 +-
 board/qemu/x86_64/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 17500961d3..b003ad5373 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index ecd7813a1e..ed7b5f5532 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "root=/dev/vda" -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
-- 
2.13.6
