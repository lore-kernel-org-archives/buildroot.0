From: Petri Gynther <pgynther@google.com>
Date: Thu,  4 Aug 2016 15:29:58 -0700
Subject: [Buildroot] [PATCH 1/3] toolchain: configs: improve toolchain
	config readability
Message-ID: <1470349800-27521-1-git-send-email-pgynther@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add (or move) comment lines in toolchain-related Config.in files
to improve readability of the toolchain config section.

Source linux-headers/Config.in.host after toolchain-buildroot items.

For toolchain-buildroot case, the config file now looks like this:
*
* Toolchain
*

*
* Toolchain Buildroot Options
*

*
* Kernel Header Options
*

*
* uClibc Options
*

*
* Binutils Options
*

*
* GCC Options
*

*
* Host GDB Options
*

*
* Toolchain Generic Options
*

Signed-off-by: Petri Gynther <pgynther@google.com>
---
 package/gdb/Config.in.host              | 2 ++
 package/linux-headers/Config.in.host    | 4 ++--
 package/uclibc/Config.in                | 4 ++--
 toolchain/toolchain-buildroot/Config.in | 5 +++--
 toolchain/toolchain-common.in           | 2 ++
 toolchain/toolchain-external/Config.in  | 2 ++
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 081073b..a36dc0f 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -1,3 +1,5 @@
+comment "Host GDB Options"
+
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
 	# When the external toolchain gdbserver is used, we shouldn't
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae5cc5d..93946ac 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -1,8 +1,8 @@
+comment "Kernel Header Options"
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS
 	bool
 
-comment "Kernel Header Options"
-
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 7c99195..6c16ed4 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,12 +1,12 @@
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
+comment "uClibc Options"
+
 config BR2_PACKAGE_UCLIBC
 	bool
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 
-comment "uClibc Options"
-
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
 	default "package/uclibc/uClibc-ng.config"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0b97bbf..e713d74 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -2,6 +2,8 @@
 
 if BR2_TOOLCHAIN_BUILDROOT
 
+comment "Toolchain Buildroot Options"
+
 config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 	string "custom toolchain vendor name"
 	default "buildroot"
@@ -18,8 +20,6 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
-source "package/linux-headers/Config.in.host"
-
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
@@ -90,6 +90,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+source "package/linux-headers/Config.in.host"
 source "package/linux-headers/Config.in"
 source "package/musl/Config.in"
 source "package/uclibc/Config.in"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 03fa880..ccf259a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,6 +5,8 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
+comment "Toolchain Generic Options"
+
 # https://sourceware.org/bugzilla/show_bug.cgi?id=19405
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 	bool
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f54fbee..bb0dde1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1,5 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL
 
+comment "Toolchain External Options"
+
 choice
 	prompt "Toolchain"
 
-- 
2.8.0.rc3.226.g39d4020
