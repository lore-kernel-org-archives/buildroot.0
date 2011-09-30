From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 30 Sep 2011 08:49:23 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
Message-ID: <4E856673.8020205@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On my old build system (openSUSE 10.3) I had problems compiling GDB saying something like my glibc is too old. So I tried the latest version and could compile without a problem. See the patch below.

Yegor 
--------------------------------------------------------------
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 toolchain/gdb/Config.in |    6 ++++++
 1 file changed, 6 insertions(+)

Index: b/toolchain/gdb/Config.in
===================================================================
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -59,6 +59,11 @@
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
+	config BR2_GDB_VERSION_7_3_1
+		bool "gdb 7.3.1"
+		depends on !BR2_bfin
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
 endchoice
 
 config BR2_GDB_VERSION
@@ -69,3 +74,4 @@
 	default "6.8"      if BR2_GDB_VERSION_6_8
 	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
 	default "7.1"      if BR2_GDB_VERSION_7_1
+	default "7.3.1"    if BR2_GDB_VERSION_7_3_1
