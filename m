From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] toolchain/gdb: Add GDB 7.0.1 and
	7.1 support
Message-ID: <20100502074441.9503A8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ca43d88bcdaf415bfdee3e267a5c09e23d9f8f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 toolchain/gdb/Config.in |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 385a682..d1372ad 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Toolchain: uClibc 0.9.30.3 / 0.9.31, older 0.9.30.x removed.
 	2.6.33 kernel headers, binutils 2.20.1, removed broken nios2
 	support, ppc e300cX/e500mc support, improved external
-	toolchain support.
+	toolchain support, GDB 7.x support.
 
 	X.org updated to 7.5.
 
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
-- 
1.6.3.3
