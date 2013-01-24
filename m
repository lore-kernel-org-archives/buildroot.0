From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Jan 2013 13:52:04 +0100
Subject: [Buildroot] [git commit] gdb: Add support for gdb 7.5.1 and make it
	the default
Message-ID: <20130125185918.6F0A59A7E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fe6a4d0b7f994d2fd484ddd6af44480a8868209
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 6a8e48e..53dcb93 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -45,7 +45,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_4
+	default BR2_GDB_VERSION_7_5
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -95,6 +95,12 @@ choice
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
+	config BR2_GDB_VERSION_7_5
+		bool "gdb 7.5.x"
+		depends on !BR2_bfin
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
+
 endchoice
 
 comment "gdb support needs pthread debug support in toolchain"
@@ -110,3 +116,4 @@ config BR2_GDB_VERSION
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
+	default "7.5.1"    if BR2_GDB_VERSION_7_5
