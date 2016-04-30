From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:43:03 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: bump version of Linaro
	ARMeb toolchain
In-Reply-To: <1462020184-29735-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020184-29735-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1462020184-29735-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 6 +++---
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d0c968d..8ba8583 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -81,7 +81,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 
 # See the note above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2015.11"
+	bool "Linaro armeb 2016.02"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -94,8 +94,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2015.08 (based on gcc 5.1), Linaro GDB
-	  2015.08 (based on GDB 7.10), glibc 2.21, Binutils 2015.10
+	  uses Linaro GCC 2016.02 (based on gcc 5.3), Linaro GDB
+	  2016.02 (based on GDB 7.10), glibc 2.21, Binutils 2015.10
 	  (based on 2.25). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 72ababd..89be483 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -46,7 +46,7 @@ sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-lin
 sha256 dd66f07662e1f3b555eaa0d076f133b6db702ab0b9ab18f7dfc91a23eab653c5  gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
-sha256 e3df0c31d0bd8d1f6d45d585203c0f601e50b1ff7225da1423a8ca36e8caf58f  gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 f488caf46680b0c0a16b66b43fbfd157e3d6389df18e957983132e89529a9804  gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
 sha256 b318a1837a54146b0120a13852386576e38355513b4e2cd5e2125f9c26913777  gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 575f686..7b42582 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -330,8 +330,8 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.t
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/armeb-linux-gnueabihf
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-- 
2.6.4
