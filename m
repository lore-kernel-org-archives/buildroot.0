From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:21:46 +0200
Subject: [Buildroot] [git commit] toolchain-external/CodeSourcery MIPS:
	available only for R2
Message-ID: <20151017142156.74C917FF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99f8084c74ac7646b0d4c33b1dd4f9b0441e4e95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the CodeSourcery toolchains for MIPS can be selected to build
mips32 (revision level 1) targets, but the resulting binaries are built
for mips32r2 instead. This is because these toolchains don't have
library support other than mips32r2, so there is no point to allow the
selection of a mips32 variant with a CodeSourcery MIPS toolchain, since
everything will be built for mips32r2 instead.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 18eb784..4291394 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -193,11 +193,10 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_mips_32r2 || BR2_mips_64r2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
-	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -281,11 +280,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	bool "Sourcery CodeBench MIPS 2014.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_mips_32r2 || BR2_mips_64r2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
-	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -369,11 +367,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	bool "Sourcery CodeBench MIPS 2014.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_mips_32r2 || BR2_mips_64r2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
-	# Unsupported for MIPS R6
-	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
