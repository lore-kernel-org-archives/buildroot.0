From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  3 Mar 2019 22:57:11 +0100
Subject: [Buildroot] [PATCH] config-fragments: drop old crosstool-ng
 toolchains
Message-ID: <20190303215712.7862-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These toolchains are very old and cause a number of autobuilder failures
that doesn't happen with more recent toolchains:

Fixes (glibc 2.18 does not provide O_TMPFILE):
http://autobuild.buildroot.net/results/c49e8361a1d4406eefd8fc1b35c8e5b061aa403b

Fixes (x86 toolchain built without libquadmath):
http://autobuild.buildroot.net/results/2d9724f169ccd60c7feb1cb549f1e2e1e9219ac3/

Use Codesourcery ARM toolchain (GCC 4.8.3) to provide a test with a old GCC
version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../autobuild/armv5-ctng-linux-gnueabi.config               | 10 ----------
 .../autobuild/armv7-ctng-linux-gnueabihf.config             | 13 -------------
 .../config-fragments/autobuild/i686-ctng-linux-gnu.config   | 10 ----------
 .../autobuild/mips64el-ctng_n32-linux-gnu.config            |  9 ---------
 .../autobuild/mips64el-ctng_n64-linux-gnu.config            | 11 -----------
 .../autobuild/powerpc-ctng_e500v2-linux-gnuspe.config       | 11 -----------
 support/config-fragments/autobuild/toolchain-configs.csv    |  9 +--------
 .../autobuild/x86_64-ctng_locales-linux-gnu.config          | 11 -----------
 8 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
 delete mode 100644 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
 delete mode 100644 support/config-fragments/autobuild/i686-ctng-linux-gnu.config
 delete mode 100644 support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
 delete mode 100644 support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
 delete mode 100644 support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
 delete mode 100644 support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config

diff --git a/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config b/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
deleted file mode 100644
index c2f4cb62ca..0000000000
--- a/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_arm=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config b/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
deleted file mode 100644
index 60ec952940..0000000000
--- a/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
+++ /dev/null
@@ -1,13 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv7-ctng-linux-gnueabihf"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/i686-ctng-linux-gnu.config b/support/config-fragments/autobuild/i686-ctng-linux-gnu.config
deleted file mode 100644
index 9a961123c3..0000000000
--- a/support/config-fragments/autobuild/i686-ctng-linux-gnu.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_i686=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i686-ctng-linux-gnu.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i686-ctng-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config b/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
deleted file mode 100644
index cf33ea26f3..0000000000
--- a/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_mips64el=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n32-linux-gnu.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="mips64el-ctng_n32-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config b/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
deleted file mode 100644
index 942a1b13b5..0000000000
--- a/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_mips64el=y
-BR2_MIPS_NABI64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="mips64el-ctng_n64-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config b/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
deleted file mode 100644
index e82d3fbda7..0000000000
--- a/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_8548=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index c51335ac63..60ce1a9786 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -19,11 +19,10 @@ support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 
 # Test a toolchain with an old gcc version (gcc 4.8)
-support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
+support/config-fragments/autobuild/sourcery-arm.config,x86
 
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
-support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -59,18 +58,12 @@ support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
-support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config,x86
-support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config,x86
-support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config,x86
 support/config-fragments/autobuild/sourcery-arm-armv4t.config,x86
-support/config-fragments/autobuild/sourcery-arm.config,x86
 support/config-fragments/autobuild/sourcery-arm-thumb2.config,x86
 support/config-fragments/autobuild/sourcery-mips64.config,x86
 support/config-fragments/autobuild/sourcery-mips.config,x86
 support/config-fragments/autobuild/sourcery-nios2.config,x86
 support/config-fragments/autobuild/sourcery-x86-64.config,x86
-support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config,x86
diff --git a/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config b/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
deleted file mode 100644
index 435034be27..0000000000
--- a/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_x86_64=y
-BR2_x86_corei7=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/x86_64-ctng_locales-linux-gnu.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-ctng_locales-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.11.0
