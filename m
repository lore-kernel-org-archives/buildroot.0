From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 22:44:20 +0300
Subject: [Buildroot] [PATCH] Add GDB 7.0.1 and 7.1 support
Message-ID: <20100429194420.6657.9268.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 toolchain/gdb/Config.in |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index e383949..f4fbaab 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -56,6 +56,14 @@ choice
 		bool "gdb 6.8"
 		depends on !BR2_avr32
 
+	config BR2_GDB_VERSION_7_0_1
+		bool "gdb 7.0.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_1
+		bool "gdb 7.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
 endchoice
 
 config BR2_GDB_VERSION
@@ -66,3 +74,5 @@ config BR2_GDB_VERSION
 	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 	default "6.8"      if BR2_GDB_VERSION_6_8
+	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
+	default "7.1"      if BR2_GDB_VERSION_7_1
