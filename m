From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:41:24 +0100
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external-codescape-img-mips: bump to 2018.09-02
Message-ID: <20181201204457.BE7D48111F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75f832d079d22641cd9c0258700767b656866549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
 .../toolchain-external-codescape-img-mips/Config.in        | 14 +++++++-------
 .../toolchain-external-codescape-img-mips.hash             |  8 ++++----
 .../toolchain-external-codescape-img-mips.mk               |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2bfa567672..2e705f2460 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -1,19 +1,19 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2016.05"
+	bool "Codescape IMG GNU Linux Toolchain 2018.09"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape IMG GNU Linux Toolchain 2016.05 for the MIPS
-	  architecture, from Imagination Technologies. It uses gcc
-	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.7. It has support for the following variants:
+	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS architecture,
+	  from MIPS Tech LLC. It uses gcc 6.3.0, binutils 2.28.51, glibc 2.20,
+	  gdb 7.9.1 and kernel headers 4.7. It has support for the following
+	  variants:
 	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
index 6a12cfa078..b540164a29 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
@@ -1,4 +1,4 @@
-# Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
-sha256 8d9cdf711dd402d7bf82883d425c221038fe8ce9d0c91a3f6b30939d9d55476c  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-sha256 6e2784d6df962fe4db7510c8a62ce3947b73f54207b10e18b52da59d1bc487bd  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86_64.tar.gz
+# Codescape toolchains from MIPS Tech LLC
+# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
+sha256 ac035f3b6a8767522977963d8e1490520d58bccca7956f4503a1eefff6492b71  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
+sha256 09280f4fcbb993607905bf9a43bf5f3db2beed85726f0675b8453e19a9ddc429  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
index 49a7027dfb..55424918c7 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-06
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2018.09-02
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
 else
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-5.x86_64.tar.gz
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
 endif
 
 # Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
