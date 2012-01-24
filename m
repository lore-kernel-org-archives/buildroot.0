From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 22:28:47 +0100
Subject: [Buildroot] [git commit] gdb: add 7.4, mark 7.1 as deprecated
Message-ID: <20120124223446.406CC9039B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21f39f524ff52e0649c88acf32fb78d3592fb3c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 9868580..8501983 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_3
+	default BR2_GDB_VERSION_7_4
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -58,6 +58,7 @@ choice
 	config BR2_GDB_VERSION_7_1
 		bool "gdb 7.1"
 		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
@@ -73,6 +74,12 @@ choice
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
+	config BR2_GDB_VERSION_7_4
+		bool "gdb 7.4.x"
+		depends on !BR2_bfin
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
+
 endchoice
 
 comment "gdb 7.x support needs pthread debug support in toolchain"
@@ -88,3 +95,4 @@ config BR2_GDB_VERSION
 	default "7.1a"     if BR2_GDB_VERSION_7_1
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
+	default "7.4"      if BR2_GDB_VERSION_7_4
