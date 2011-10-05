From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 15:20:12 +0200
Subject: [Buildroot] [git commit] gdb: bump to 7.3.1
Message-ID: <20111005150453.C00118DEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3903c3a73dabcdbdf13d3ff09dedef6a8589ab4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this version fixes compilation issue on some old build systems like
openSUSE 10.3 saying some host libraries were too old

[Peter: drop bugfix number from config name, similar to kernel-headers]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8295f79..6bf7fd4 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -59,6 +59,11 @@ choice
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
+	config BR2_GDB_VERSION_7_3
+		bool "gdb 7.3.x"
+		depends on !BR2_bfin
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
 endchoice
 
 config BR2_GDB_VERSION
@@ -69,3 +74,4 @@ config BR2_GDB_VERSION
 	default "6.8"      if BR2_GDB_VERSION_6_8
 	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
 	default "7.1"      if BR2_GDB_VERSION_7_1
+	default "7.3.1"    if BR2_GDB_VERSION_7_3
