From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:19:06 +0100
Subject: [Buildroot] [git commit] toolchain-external: mark Microblaze
	external toolchains as deprecated
Message-ID: <20131231081149.B6A649C29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89be0985d6e6128878340ef8e3a3caa1315c7a63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Xilinx Microblaze external toolchains that we had support for are
very old, and are causing a huge number of build issues. Thanks to
Spenser Gilliland, we now have support for Microblaze in the internal
toolchain backend, and the autobuilders have been using the internal
toolchain backend since then. Therefore, it's time to deprecate those
old and unusable external toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3bd17f3..e559902 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -704,6 +704,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_DEPRECATED
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -717,6 +718,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_DEPRECATED
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -728,6 +730,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_DEPRECATED
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -741,6 +744,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	depends on BR2_microblazebe
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_DEPRECATED
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
