From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 14 May 2013 22:16:28 +0200
Subject: [Buildroot] [PATCHv3 2/2] external-toolchain: remove Sourcery
	CodeBench ARM 2011.03
In-Reply-To: <1368562588-1641-1-git-send-email-olivier.schonken@gmail.com>
References: <1368562588-1641-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1368562588-1641-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 toolchain/toolchain-external/Config.in   | 24 ------------------------
 toolchain/toolchain-external/ext-tool.mk |  5 +----
 2 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5fdd27b..ebdc18a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -276,30 +276,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
-	bool "Sourcery CodeBench ARM 2011.03"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
-	  2.13 and gdb 7.2.50, kernel headers 2.6.38. It has support
-	  for the following variants:
-	    - ARMv5TE, little endian, soft-float, glibc
-	      Select ARM926T, ARM10T, XScale or another ARMv5 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv4T, little endian, soft-float, glibc
-	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mthumb
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	bool "Sourcery CodeBench MIPS 2011.09"
 	depends on BR2_mips || BR2_mipsel
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e993fe8..767727f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -191,10 +191,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
-- 
1.8.1.2
