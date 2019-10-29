From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:24:32 +0100
Subject: [Buildroot] [git commit] board/qemu/arm-vexpress-tz: fixup GDB
 config info
Message-ID: <20191029211816.2FC8D7F9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a89a3f662c1deccf99bfc7a692cd8373f39c075d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes reference path "../build/optee_os-" to "./output/build/optee-os-"
as package is optee-os and symbol file here is reached from BR top
dir and assuming output in output/.

Updates GDB tool name to arm-linux-gdb.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/qemu/arm-vexpress-tz/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index f058dbae4a..35ff018aec 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -99,7 +99,7 @@ From a first shell:
 	-S
 
 From a second shell:
-  ./output/host/bin/arm-linux-gnueabihf-gdb
+  ./output/host/bin/arm-linux-gdb
   GNU gdb (GNU Toolchain for the A-profile Architecture 8.2-2018-08 (arm-rel-8.23)) 8.1.1.20180704-git
   Copyright (C) 2018 Free Software Foundation, Inc.
   ...
@@ -111,7 +111,7 @@ From this GDB console, connect to the target, load the OP-TEE core symbols,
 set a breakpoint to its entry point (__text_start) and start emulation:
 
   (gdb) target remote 127.0.0.1:1234
-  (gdb) symbol-file ../build/optee_os-<reference>/out/arm/core/tee.elf
+  (gdb) symbol-file ./output/build/optee-os-<reference>/out/arm/core/tee.elf
   (gdb) hbreak __text_start
   Hardware assisted breakpoint 1 at 0xe100000: file core/arch/arm/kernel/generic_entry_a32.S, line 246.
   (gdb) cont
