From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:19:46 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump CodeSourcery
	aarch64 to 2014.11
Message-ID: <20160430164629.BB3D180295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7a682be31750726a4dfc84a7ea5ef650baa4e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Runtime tested using qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas: updated to the latest master branch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 13 +++++++------
 toolchain/toolchain-external/toolchain-external.hash |  4 ++--
 toolchain/toolchain-external/toolchain-external.mk   |  8 ++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cd86176..6604316 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -597,7 +597,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	  http://www.linaro.org/engineering/armv8/
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	bool "CodeSourcery AArch64 2014.05"
+	bool "CodeSourcery AArch64 2014.11"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -605,12 +605,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Sourcery CodeBench toolchain for the AArch64 architecture,
-	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24,
-	  glibc 2.18, gdb 7.7.50 and kernel headers 3.13.
+	  from Mentor Graphics. It uses gcc 4.9.1, binutils
+	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
+	  3.16.2.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain (experimental)"
@@ -719,7 +720,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 0ed253d..2f1c44f 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -31,8 +31,8 @@ sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-20
 sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 a4de11669cddd4594f228db7bd38b0fed3c8692d1bac021739390b4c766bbd4f  amd-2015.11-36-x86_64-amd-linux-gnu.src.tar.bz2
 # Aarch64
-sha256 8ea78c5988b2bb507534f1ad46aa46659f66b39d55f2fc40e163a90b4195e70f  aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 fef1ba94b43f2aefe5634815745c1cb5442a12d12d98e653601392cb65517b7f  aarch64-2014.05-30-aarch64-linux-gnu.src.tar.bz2
+sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
 # There is one source file that covers both binary distributions.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3efe182..5bd1df7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -381,14 +381,14 @@ TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binar
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
-	ln -sf ld-2.18.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
+	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
 endef
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
 define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
-	ln -sf ld-2.18.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
+	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
 endef
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
