From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 27 Dec 2016 22:03:56 +0100
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery NIOSII to
	2016.11
Message-ID: <20161227210356.12559-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 since it's not fixed in
Binutils 2.26.

Runtime tested with an experimental version of Qemu 2.7 for Nios2.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-niosII/Config.in         | 12 ++++++------
 .../toolchain-external-codesourcery-niosII.hash              |  4 ++--
 .../toolchain-external-codesourcery-niosII.mk                |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 54eed8c..9675c67 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2016.05"
+	bool "Sourcery CodeBench Nios-II 2016.11"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -8,10 +8,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.26
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
-	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
+	  from Mentor Graphics. It uses gcc 6.2, binutils 2.26,
+	  glibc 2.24, gdb 7.11 and kernel headers 4.7.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
index a60c49f..17130b4 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
+sha256 97e3b878c67e46430f2b9a42b11bc95b1ef9fef263e6b5ee9103d1239c9e847d  sourceryg++-2016.11-32-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 ee2c4391137be8fee987411301bbf9f0e4a823400e37c9f8c1cae9900485cbca  sourceryg++-2016.11-32-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
index 3eb6679..7381061 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.05-10
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.11-32
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-- 
2.9.3
