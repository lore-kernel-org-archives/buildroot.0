From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 24 Sep 2016 11:37:53 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump version of Linaro
	AArch64 toolchain
In-Reply-To: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
References: <1474709873-21387-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1474709873-21387-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb version is 7.11.1 not 7.10 as stated in the link below [1].
See the manifest to check the version really used [2].

Tested with Qemu 2.6.1 and qemu_aarch64_virt_defconfig.
As reported by Gustavo Zacarias, this defconfig is known to fail with qemu
versions lower than 2.6.0.

[1] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05
[2] https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/aarch64-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-linux-manifest.txt
[3] 41fb9f23fa155738201aa9787cb8fe40053d47bc

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 2 +-
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 807a667..2b17b7a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -551,7 +551,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 
 # See note about Linaro ARM/ARMEB toolchains, above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2016.02"
+	bool "Linaro AArch64 2016.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1dc7963..9059175 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -43,7 +43,7 @@ sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-lin
 sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 sha256 a7b8f842fdc9d9be22ca4e0c999429780fc6f16ea798b032421b5ec0cfa53b3e  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
-sha256 1c85af550bedd378be583317b4abbdc96342b42c19fb19873c13d3093ff694ad  gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
+sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 9fa6fc0..6fd2742 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -388,8 +388,8 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.x
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
 else
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/aarch64-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
-- 
2.5.5
