From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 20:00:34 +0200
Subject: [Buildroot] [PATCH 2/9] gcc: select the appropriate
	BR2_TOOLCHAIN_GCC_AT_LEAST_* option
In-Reply-To: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1438711241-31792-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit wires up the gcc version dependency mechanism in the
internal toolchain backend by making the gcc version choice in the gcc
package Config.in.host select the appropriate
BR2_TOOLCHAIN_GCC_AT_LEAST_* option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 93c9032..baa7956 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -34,6 +34,7 @@ choice
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		select BR2_GCC_NEEDS_MPC
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 	config BR2_GCC_VERSION_4_7_X
 		bool "gcc 4.7.x"
@@ -50,6 +51,7 @@ choice
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
 		select BR2_GCC_NEEDS_MPC
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 	config BR2_GCC_VERSION_4_8_X
 		bool "gcc 4.8.x"
@@ -64,12 +66,15 @@ choice
 		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 	config BR2_GCC_VERSION_4_8_ARC
 		bool "gcc 4.8-arc"
 		# Only supported architecture
 		depends on BR2_arc
 		select BR2_GCC_NEEDS_MPC
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
@@ -78,6 +83,7 @@ choice
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 	config BR2_GCC_VERSION_5_X
 		bool "gcc 5.x"
@@ -85,6 +91,7 @@ choice
 		depends on !BR2_arc
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 endchoice
 
-- 
2.5.0
