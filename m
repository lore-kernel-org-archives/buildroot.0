From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Jan 2013 14:44:06 +0100
Subject: [Buildroot] [git commit] gdb: remove 6.8 / 7.0.1 / 7.1,
	deprecate 7.2 / 7.3
Message-ID: <20130125185918.8920E80784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cf65c41c868e19a974b31bbeb54d6b5bac77b8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gdb/6.8a/600-fix-compile-flag-mismatch.patch   |   31 --------------------
 toolchain/gdb/Config.in                            |   24 +--------------
 2 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 13b72bb..0000000
--- a/toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/gdb/gdbserver/configure
-+++ b/gdb/gdbserver/configure
-@@ -1239,7 +1239,7 @@
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo x$ac_old_val`" != "`echo x$ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -272,7 +272,7 @@
- PACKAGE_BUGREPORT=
- 
- ac_unique_file="main.c"
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- # Factoring default headers for most tests.
- ac_includes_default="\
- #include <stdio.h>
-@@ -3077,7 +3077,7 @@
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- # Provide defaults for some variables set by the per-host and per-target
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 53dcb93..69f7915 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -58,34 +58,17 @@ choice
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
-	config BR2_GDB_VERSION_6_8
-		bool "gdb 6.8"
-		depends on !(BR2_avr32 || BR2_bfin)
-		depends on BR2_DEPRECATED
-
-	config BR2_GDB_VERSION_7_0_1
-		bool "gdb 7.0.1"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_1
-		bool "gdb 7.1"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
 	config BR2_GDB_VERSION_7_2
 		bool "gdb 7.2.x"
 		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
 	config BR2_GDB_VERSION_7_3
 		bool "gdb 7.3.x"
 		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
@@ -110,9 +93,6 @@ config BR2_GDB_VERSION
 	string
 	default "6.6a"     if BR2_GDB_VERSION_6_6
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "6.8a"     if BR2_GDB_VERSION_6_8
-	default "7.0.1a"   if BR2_GDB_VERSION_7_0_1
-	default "7.1a"     if BR2_GDB_VERSION_7_1
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
