From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:20:18 +0200
Subject: [Buildroot] [git commit] gcc: remove BR2_GCC_SUPPORTS_GRAPHITE
Message-ID: <20161016103710.2C03B80649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b9d22ca4aac0c30813cd2e5b2367951b9c93ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The blind option BR2_GCC_SUPPORTS_GRAPHITE was used to distinguish gcc
versions that support the graphite loop optimizer. But since a while
already, all the versions we support do support graphite. So this symbol
isn't needed anymore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 514c21b..df60c65 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -1,8 +1,5 @@
 comment "GCC Options"
 
-config BR2_GCC_SUPPORTS_GRAPHITE
-	bool
-
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
@@ -31,14 +28,12 @@ choice
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 	config BR2_GCC_VERSION_ARC
 		bool "gcc arc (6.x)"
 		# Only supported architecture
 		depends on BR2_arc
-		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 	config BR2_GCC_VERSION_4_9_X
@@ -58,7 +53,6 @@ choice
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
-		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 	config BR2_GCC_VERSION_5_X
@@ -72,7 +66,6 @@ choice
 			!BR2_mips_m5101 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 	config BR2_GCC_VERSION_6_X
@@ -81,7 +74,6 @@ choice
 		depends on !BR2_arc
 		# Unsupported MIPS cores
 		depends on !BR2_mips_p6600
-		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 endchoice
@@ -167,7 +159,6 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 
 config BR2_GCC_ENABLE_GRAPHITE
 	bool "Enable graphite support"
-	depends on BR2_GCC_SUPPORTS_GRAPHITE
 	help
 	  This option enables the graphite optimizations in the
 	  compiler.
