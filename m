From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  4 Oct 2011 11:05:47 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
Message-ID: <1317719147-19210-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

this version fixes compilation issue on some old build systems like
openSUSE 10.3 saying some host libraries were too old

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 toolchain/gdb/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8295f79..2da965e 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -59,6 +59,11 @@ choice
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
+	config BR2_GDB_VERSION_7_3_1
+		bool "gdb 7.3.1"
+		depends on !BR2_bfin
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
 endchoice
 
 config BR2_GDB_VERSION
@@ -69,3 +74,4 @@ config BR2_GDB_VERSION
 	default "6.8"      if BR2_GDB_VERSION_6_8
 	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
 	default "7.1"      if BR2_GDB_VERSION_7_1
+	default "7.3.1"    if BR2_GDB_VERSION_7_3_1
-- 
1.7.5.4
