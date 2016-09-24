From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 24 Sep 2016 11:37:52 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: bump version of Linaro
	ARMeb toolchain
In-Reply-To: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
References: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1474709873-21387-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb version is 7.11.1 not 7.10 as stated in the link below [1].
See the manifest to check the version really used [2].

[1] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05
[2] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-linux-manifest.txt

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 6 +++---
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ab1ccd5..807a667 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -87,7 +87,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 
 # See the note above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2016.02"
+	bool "Linaro armeb 2016.05"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -101,8 +101,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2016.02 (based on gcc 5.3), Linaro GDB
-	  2016.02 (based on GDB 7.10), glibc 2.21, Binutils 2015.10
+	  uses Linaro GCC 2016.05 (based on gcc 5.3.1), Linaro GDB
+	  2016.05 (based on GDB 7.11.1), glibc 2.21, Binutils 2016.05
 	  (based on 2.25). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 9068741..1dc7963 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -40,7 +40,7 @@ sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-lin
 sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
-sha256 f488caf46680b0c0a16b66b43fbfd157e3d6389df18e957983132e89529a9804  gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 sha256 a7b8f842fdc9d9be22ca4e0c999429780fc6f16ea798b032421b5ec0cfa53b3e  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
 sha256 1c85af550bedd378be583317b4abbdc96342b42c19fb19873c13d3093ff694ad  gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index caa1253..9fa6fc0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -345,8 +345,8 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.t
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
 else
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/armeb-linux-gnueabihf
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-- 
2.5.5
