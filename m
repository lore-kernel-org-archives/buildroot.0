From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 17:15:44 +0200
Subject: [Buildroot] [git commit] toolchain-external: update musl-cross
	toolchain to 1.1.6
Message-ID: <20150423152052.AA64181D9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e313e1376144225473cefbe090afdbb5885c919
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 1.1.6 version of musl-cross fixes the two issues that had been
preventing versions after 1.1.1 being used by buildroot, namely:
- sysroot is enabled again
- kernel headers are included again

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |    6 +++---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2b99cc..9433101 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -814,7 +814,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	  glibc 2.18, gdb 7.7.50 and kernel headers 3.13.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.1 toolchain"
+	bool "Musl 1.1.6 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
@@ -825,8 +825,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  Toolchain based on the Musl C library, provided by the
-	  musl-cross project. It uses gcc 4.8.3, binutils 2.24 and
-	  musl 1.1.1. It does not have a cross debugger included.
+	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
+	  musl 1.1.6. It does not have a cross debugger included.
 
 	  The ARM toolchain is built for ARMv4t, soft-float.
 	  The x86 toolchain is built for i486.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2427463..11345cc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -356,7 +356,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_VERSION = 1.1.1
+TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
 ifeq ($(BR2_arm),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
