From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:36:11 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: bump
	CodeSourcery NIOSII to 2016.05
Message-ID: <20160523180823.D5DCA81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04c9d650398b8ad5be53336854a323eadcd648dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The toolchain still use binutils 2.25 without the fix for PR19405.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 8 ++++----
 toolchain/toolchain-external/toolchain-external.hash | 4 ++--
 toolchain/toolchain-external/toolchain-external.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0ba5d46..ce2d91e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -403,7 +403,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	      Disable 'Use soft-float'
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2015.11"
+	bool "Sourcery CodeBench Nios-II 2016.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -411,13 +411,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
-	  glibc 2.22, gdb 7.10.50 and kernel headers 4.2.
+	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
+	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "Sourcery CodeBench SH 2012.09"
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index fcd735b..ef4c7e2 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -10,8 +10,8 @@ sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfi
 sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
 # NiosII
-sha256 e43899fd950e5d06e90c2eb01527c626240b6b4a603cbbeb532fad9fb8ea58c3  sourceryg++-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 c412375ba3f93bafc9225de22366fa5b3f4d073ef856cf19595237ddb0815e6d  sourceryg++-2015.11-130-nios2-linux-gnu.src.tar.bz2
+sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 24c1f03..3d71ef4 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -338,7 +338,7 @@ TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-l
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
