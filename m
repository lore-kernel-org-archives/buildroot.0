From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 19:04:23 +0100
Subject: [Buildroot] [git commit] configs/qemu: enable SMP for x86 & x86_64
Message-ID: <20160108182923.0E5FA827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1968440f35ff5d035f4767c29ed3fd6446965523
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the 21st century, so enable SMP for them.

[Peter: add note to readme.txt about how emulate a SMP system in QEMU]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/x86/linux-4.3.config    | 1 +
 board/qemu/x86/readme.txt          | 2 ++
 board/qemu/x86_64/linux-4.3.config | 1 +
 board/qemu/x86_64/readme.txt       | 2 ++
 4 files changed, 6 insertions(+)

diff --git a/board/qemu/x86/linux-4.3.config b/board/qemu/x86/linux-4.3.config
index 20726c3..4dcc995 100644
--- a/board/qemu/x86/linux-4.3.config
+++ b/board/qemu/x86/linux-4.3.config
@@ -1,4 +1,5 @@
 CONFIG_SYSVIPC=y
+CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index da8384a..62c51b0 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -2,6 +2,8 @@ Run the emulation with:
 
   qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda -net nic,model=rtl8139 -net user
 
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.3.0
diff --git a/board/qemu/x86_64/linux-4.3.config b/board/qemu/x86_64/linux-4.3.config
index 20726c3..4dcc995 100644
--- a/board/qemu/x86_64/linux-4.3.config
+++ b/board/qemu/x86_64/linux-4.3.config
@@ -1,4 +1,5 @@
 CONFIG_SYSVIPC=y
+CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 7c39563..e2be574 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -2,6 +2,8 @@ Run the emulation with:
 
   qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda -net nic,model=rtl8139 -net user
 
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.3.0
