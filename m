From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 16:11:24 +0100
Subject: [Buildroot] [git commit] toolchain-external: Remove
	BLACKFIN_UCLINUX_2012R2
Message-ID: <20151004151805.D7A3480E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24dc18706166a5d0c0e092d50491a5e254e246ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   19 -------------------
 toolchain/toolchain-external/toolchain-external.mk |    8 ++------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 18bf98c..c252d3f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -792,23 +792,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	bool "Blackfin.uclinux.org 2012R2-RC2"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
@@ -958,8 +941,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8d3eb29..33d2f8d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -142,7 +142,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
@@ -362,10 +362,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
@@ -434,7 +430,7 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
