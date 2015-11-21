From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:14 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery AMD64:
	support only one version
Message-ID: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/Config.in             | 4 ++--
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f2eed7f..1a08085 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -692,7 +692,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	    - SH4A, uClibc, big endian
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	bool "Sourcery CodeBench AMD64 2014.05"
 	depends on BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -1001,7 +1001,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
-	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
+	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 613ce50..8176370 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -385,7 +385,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-- 
2.4.3
