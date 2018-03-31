From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:49 -0300
Subject: [Buildroot] [PATCH 24/36] toolchain/*/Config.in: fix attributes
 order
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-25-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 toolchain/Config.in                                          |  2 +-
 toolchain/toolchain-buildroot/Config.in                      |  2 +-
 .../toolchain-external-custom/Config.in.options              | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf1166b601..a47ffbd2d7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -42,8 +42,8 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
+	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 9668f8d41a..0ab7e8db97 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -27,13 +27,13 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	select BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
 		   BR2_arm     || BR2_armeb    || \
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
 		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
+	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
 	  cross-compilation toolchain.
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 70c7d8e3c3..6c12b1619c 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -320,8 +320,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LOCALE
 
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	bool "Toolchain has threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS
 	default y
+	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Select this option if your external toolchain has thread
 	  support. If you don't know, leave the default value,
@@ -331,8 +331,8 @@ if BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 	bool "Toolchain has threads debugging support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	default y
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	help
 	  Select this option if your external toolchain has thread
 	  debugging support. If you don't know, leave the default
@@ -340,8 +340,8 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
 	bool "Toolchain has NPTL threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	default y
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Select this option if your external toolchain uses the NPTL
 	  (Native Posix Thread Library) implementation of Posix
@@ -354,9 +354,9 @@ endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	bool "Toolchain has SSP support?"
-	select BR2_TOOLCHAIN_HAS_SSP
 	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Selection this option if your external toolchain has Stack
 	  Smashing Protection support enabled. If you don't know,
@@ -365,9 +365,9 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
 	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Select this option if your external toolchain supports
 	  RPC. If you don't know, leave the default value, Buildroot
-- 
2.14.1
