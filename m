From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 20:59:59 +0100
Subject: [Buildroot] [PATCH 06/16] external-toolchain: remove 2009q1 ARM
	Sourcery toolchain
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <17b8cc930c2a9d092b4ede12c01ea6200818a343.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are going to add one more ARM Sourcery toolchain version, so it's
time to remove the oldest version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   15 ---------------
 toolchain/toolchain-external/ext-tool.mk |    5 +----
 2 files changed, 1 insertions(+), 19 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index eadfe50..f983727 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -59,20 +59,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
             - ARMv4T, little endian, soft-float, glibc
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
-	bool "Sourcery CodeBench ARM 2009q1"
-	depends on BR2_arm
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.3.3, binutils 2.19, glibc 2.8
-	  and gdb 6.8 and kernel headers 2.6.30. It has support for
-	  the following variants:
-            - ARMv5T, little endian, soft-float, glibc
-            - ARMv4T, little endian, soft-float, glibc
-            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	bool "Sourcery CodeBench MIPS 2011.03"
 	depends on BR2_mips || BR2_mipsel
@@ -262,7 +248,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index dde6f22..883fbdb 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -174,10 +174,7 @@ else
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
-- 
1.7.4.1
