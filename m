From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 21:51:40 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bump CodeSourcery
	NIOSII to 2017.05
In-Reply-To: <20170430195140.6401-1-romain.naour@gmail.com>
References: <20170430195140.6401-1-romain.naour@gmail.com>
Message-ID: <20170430195140.6401-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with qemu_nios2_10m50_defconfig and Qemu 2.9.0 release.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-niosII/Config.in               | 6 +++---
 .../toolchain-external-codesourcery-niosII.hash                    | 7 +++++--
 .../toolchain-external-codesourcery-niosII.mk                      | 2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 9675c67..6bb376b 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2016.11"
+	bool "Sourcery CodeBench Nios-II 2017.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -13,5 +13,5 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.26
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 6.2, binutils 2.26,
-	  glibc 2.24, gdb 7.11 and kernel headers 4.7.
+	  from Mentor Graphics. It uses gcc 6.3, binutils 2.26,
+	  glibc 2.25, gdb 7.11 and kernel headers 4.7.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
index 17130b4..3643f92 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -1,3 +1,6 @@
+# From https://sourcery.mentor.com/GNUToolchain/release3302
+md5 54b7f7056c2159f3a9ddeca8ca775ed1 sourceryg++-2017.05-4-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+md5 529a7fecf33d0d113a446413b9d1e173 sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2
 # Locally calculated
-sha256 97e3b878c67e46430f2b9a42b11bc95b1ef9fef263e6b5ee9103d1239c9e847d  sourceryg++-2016.11-32-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 ee2c4391137be8fee987411301bbf9f0e4a823400e37c9f8c1cae9900485cbca  sourceryg++-2016.11-32-nios2-linux-gnu.src.tar.bz2
+sha256 3f0307da3c0770b7cc3ed4a845038e6e438d3e3a96ce880f9a86b3d35f948a07  sourceryg++-2017.05-4-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 6e65878d0453708ee19098d3d68985bda244938d35999f3859915a2f5574fa08  sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
index dcca94f..dfa4ea4 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.11-32
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2017.05-4
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-- 
2.9.3
