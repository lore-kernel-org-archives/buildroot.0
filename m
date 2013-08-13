From: Markos Chandras <markos.chandras@imgtec.com>
Date: Tue, 13 Aug 2013 09:45:44 +0100
Subject: [Buildroot] [PATCH v2] toolchain-external: Restrict Sourcery
	CodeBench toolchains for MIPS/n32
Message-ID: <1376383544-26722-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

n32 is not supported in Sourcery CodeBench toolchains.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 toolchain/toolchain-external/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 324401f..ad1f203 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -190,6 +190,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	bool "Sourcery CodeBench MIPS 2013.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_NABI32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -260,6 +261,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	bool "Sourcery CodeBench MIPS 2012.09"
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_NABI32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -330,6 +332,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	bool "Sourcery CodeBench MIPS 2012.03"
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_NABI32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -396,6 +399,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
+comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
+	depends on BR2_MIPS_NABI32
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
 	depends on BR2_powerpc
-- 
1.8.3.2
