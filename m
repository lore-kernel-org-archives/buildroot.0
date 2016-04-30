From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:43:02 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of Linaro
	ARM toolchain
Message-ID: <1462020184-29735-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 4 ++--
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cd86176..d0c968d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -37,7 +37,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 
 # See the note above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2015.11"
+	bool "Linaro ARM 2016.02"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -50,7 +50,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2015.08 (based on gcc 5.1), Linaro GDB 2015.08 (based on
+	  GCC 2016.02 (based on gcc 5.3), Linaro GDB 2016.02 (based on
 	  GDB 7.10), glibc 2.21, Binutils 2015.10 (based on 2.25). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 0ed253d..72ababd 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -43,7 +43,7 @@ sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-t
 # ARM and Aarch64 toolchains from Linaro
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
-sha256 ff2d231749e59968cb5e7032b4f4e4ae82ff9f11c23967863e627a6c59cb3bc0  gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 dd66f07662e1f3b555eaa0d076f133b6db702ab0b9ab18f7dfc91a23eab653c5  gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 sha256 e3df0c31d0bd8d1f6d45d585203c0f601e50b1ff7225da1423a8ca36e8caf58f  gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2422b6d..575f686 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -320,8 +320,8 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/arm-linux-gnueabihf
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 ifeq ($(HOSTARCH),x86)
-- 
2.6.4
