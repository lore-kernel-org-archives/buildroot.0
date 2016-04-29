From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 14:38:26 -0300
Subject: [Buildroot] [PATCH 3/3] qemu/x86*: update instructions to use virtio
In-Reply-To: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461951506-12010-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch the invocation command to use virtio-blk and virtio-net for
better performance.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86/readme.txt    | 4 ++--
 board/qemu/x86_64/readme.txt | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 62c51b0..4f2e4c7 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,9 +1,9 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda -net nic,model=rtl8139 -net user
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.3.0
+Tested with QEMU 2.5.0
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index e2be574..6ea28d3 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,9 +1,9 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda -net nic,model=rtl8139 -net user
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda -net nic,model=virtio -net user
 
 Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.3.0
+Tested with QEMU 2.5.0
-- 
2.7.3
