From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:41:59 +0100
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external-codescape-mti-mips: bump to 2018.09-02
Message-ID: <20181202071601.E0A5A8131E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38950668352df48349eab02da7d09a4d5cb99705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2016.05-06 toolchain we've had support for is pretty outdated at
this point, so update to the latest 2018.09-02 version.

Of note besides the typical component version bumps:

 - The toolchains are now provided by MIPS Tech LLC after its departure
   from Imagination Technologies.

 - The download site changed as a result of that.

 - The toolchains are now built targeting CentOS 6 rather than CentOS 5.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-codescape-mti-mips/Config.in        | 14 +++++++-------
 .../toolchain-external-codescape-mti-mips.hash             |  8 ++++----
 .../toolchain-external-codescape-mti-mips.mk               |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index 5d466a58f4..c07a1b88b5 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -1,20 +1,20 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	bool "Codescape MTI GNU Linux Toolchain 2016.05"
+	bool "Codescape MTI GNU Linux Toolchain 2018.09"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape MTI GNU Linux Toolchain 2016.05 for the MIPS
-	  architecture, from Imagination Technologies. It uses gcc
-	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.7. It has support for the following variants:
+	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS architecture,
+	  from MIPS Tech LLC. It uses gcc 6.3.0, binutils 2.28.51, glibc 2.20,
+	  gdb 7.9.1 and kernel headers 4.7. It has support for the following
+	  variants:
 	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
index d31f99803b..8e70af501f 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
@@ -1,4 +1,4 @@
-# Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
-sha256 3a7aba259beb05f0e3054b5a61a368a5085447f47361949a938ac9cc7de4227b  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-sha256 a676a8b3647c8c651fb8935a75db8f00b79d36ec55676f7c05bac12b550788f7  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz
+# Codescape toolchains from MIPS Tech LLC
+# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
+sha256 c883a404fd7ea5718e2249a530802e223381f2be52265f88e9b1ce7035c232f3  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
+sha256 d6310a970b0a8a19ad8e0a2b3ead8c38ee90d0e284a9b2511200ce447f460d2c  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
index d63a367578..9bee1ab87d 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2016.05-06
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2018.09-02
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
 TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STRIP_COMPONENTS = 2
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
 else
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
 endif
 
 # Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
