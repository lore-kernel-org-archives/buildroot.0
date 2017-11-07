From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Nov 2017 15:21:43 +0100
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 toolchains for 2017.11-rc1
Message-ID: <20171107142143.11527-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All Buildroot pre-built toolchains have been rebuilt with Buildroot
2017.11-rc1, so that they have the latest version of
glibc/musl/uClibc, and also the latest gcc/binutils updates.

Specifically, this will fix the build failures on Blackfin that were
due to the missing accept4() support:

  http://autobuild.buildroot.net/results/8b5a72dd7cde685f6f68f46aeee8b1b60c96d559/
  (openobex)

  http://autobuild.buildroot.net/results/b19dd9ed29944d7f79c6f824669e3baaa0bb045a/
  (libiio)

In terms of changes to the toolchains:

 - AArch64 glibc toolchain changed to use 4.4 kernel headers instead
   of 4.1, in order to increase the variety of kernel header versions
   being tested.

 - Most configurations now use 4.13 kernel headers instead of 4.12
   (except the configurations that were explicitly using an older
   kernel headers version)

 - The mips64 n64 configuration is changed from using gcc 4.9 to gcc
   5, since another ARM configuration already tests gcc 4.9.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This should be committed to the master branch.
---
 support/config-fragments/autobuild/br-aarch64-glibc.config          | 4 ++--
 support/config-fragments/autobuild/br-arcle-hs38.config             | 4 ++--
 support/config-fragments/autobuild/br-arm-basic.config              | 4 ++--
 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config    | 4 ++--
 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config     | 4 ++--
 support/config-fragments/autobuild/br-arm-cortex-m4-full.config     | 4 ++--
 support/config-fragments/autobuild/br-arm-full-nothread.config      | 4 ++--
 support/config-fragments/autobuild/br-arm-full-static.config        | 2 +-
 support/config-fragments/autobuild/br-arm-full.config               | 2 +-
 support/config-fragments/autobuild/br-bfin-full.config              | 4 ++--
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config  | 2 +-
 support/config-fragments/autobuild/br-i386-pentium4-full.config     | 2 +-
 support/config-fragments/autobuild/br-m68k-5208-full.config         | 4 ++--
 support/config-fragments/autobuild/br-m68k-68040-full.config        | 4 ++--
 support/config-fragments/autobuild/br-microblazeel-full.config      | 2 +-
 support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config   | 4 ++--
 support/config-fragments/autobuild/br-mips64-n64-full.config        | 6 +++---
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config   | 4 ++--
 support/config-fragments/autobuild/br-mipsel-o32-full.config        | 4 ++--
 support/config-fragments/autobuild/br-nios2-glibc.config            | 4 ++--
 support/config-fragments/autobuild/br-openrisc-uclibc.config        | 4 ++--
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config | 4 ++--
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config    | 4 ++--
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config | 4 ++--
 .../config-fragments/autobuild/br-powerpc64le-power8-glibc.config   | 4 ++--
 support/config-fragments/autobuild/br-sh4-full.config               | 4 ++--
 support/config-fragments/autobuild/br-sparc-uclibc.config           | 2 +-
 support/config-fragments/autobuild/br-sparc64-glibc.config          | 2 +-
 support/config-fragments/autobuild/br-x86-64-core2-full.config      | 2 +-
 support/config-fragments/autobuild/br-x86-64-musl.config            | 4 ++--
 support/config-fragments/autobuild/br-xtensa-full.config            | 4 ++--
 31 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
index 6501f15ec5..af1cbf890d 100644
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
index b9f5764603..8484f62683 100644
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
@@ -3,8 +3,8 @@ BR2_archs38=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.05-1078-g95b1dae.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.11-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index e47c742c6c..a420284cc5 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
index 662de17b37..fea1564ab2 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
index 65e2edfa86..2db2aa0b77 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
index fc514b1d97..f60df91f45 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
@@ -3,9 +3,9 @@ BR2_cortex_m4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 1e260ec90d..33034cf77a 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,9 +3,9 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index 065c454653..dd0a393136 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
index 84c225d883..659d07ce18 100644
--- a/support/config-fragments/autobuild/br-arm-full.config
+++ b/support/config-fragments/autobuild/br-arm-full.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-bfin-full.config b/support/config-fragments/autobuild/br-bfin-full.config
index 7389bb53c3..eeefcefbee 100644
--- a/support/config-fragments/autobuild/br-bfin-full.config
+++ b/support/config-fragments/autobuild/br-bfin-full.config
@@ -3,9 +3,9 @@ BR2_bf512=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
index 65119c321e..b9041a7724 100644
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
@@ -2,7 +2,7 @@ BR2_x86_pentium_mmx=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
index 37233c5975..08eb21b894 100644
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ b/support/config-fragments/autobuild/br-i386-pentium4-full.config
@@ -2,7 +2,7 @@ BR2_x86_pentium4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-m68k-5208-full.config b/support/config-fragments/autobuild/br-m68k-5208-full.config
index e6c6bdabad..bf455e0838 100644
--- a/support/config-fragments/autobuild/br-m68k-5208-full.config
+++ b/support/config-fragments/autobuild/br-m68k-5208-full.config
@@ -2,9 +2,9 @@ BR2_m68k=y
 BR2_m68k_cf5208=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
index 5cf68def9f..0766ffc3e8 100644
--- a/support/config-fragments/autobuild/br-m68k-68040-full.config
+++ b/support/config-fragments/autobuild/br-m68k-68040-full.config
@@ -1,9 +1,9 @@
 BR2_m68k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
index 4cd72d1ef2..ea920f0a70 100644
--- a/support/config-fragments/autobuild/br-microblazeel-full.config
+++ b/support/config-fragments/autobuild/br-microblazeel-full.config
@@ -1,7 +1,7 @@
 BR2_microblazeel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
index 86fb0148ec..237265bd82 100644
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
@@ -4,8 +4,8 @@ BR2_mips_32r6=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
index 503f0a2e7c..f8a67f2c65 100644
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ b/support/config-fragments/autobuild/br-mips64-n64-full.config
@@ -3,8 +3,8 @@ BR2_MIPS_NABI64=y
 # BR2_MIPS_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2017.05-1078-g95b1dae.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2017.11-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
index a8f9cb7f34..b0e9236063 100644
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
@@ -5,8 +5,8 @@ BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
index e6cedfa225..e608b424a7 100644
--- a/support/config-fragments/autobuild/br-mipsel-o32-full.config
+++ b/support/config-fragments/autobuild/br-mipsel-o32-full.config
@@ -2,9 +2,9 @@ BR2_mipsel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index c63e4a22cd..62f2665e44 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -2,8 +2,8 @@ BR2_nios2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
index 04d6b3c8bd..3a4f0b62dd 100644
--- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
+++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
@@ -1,9 +1,9 @@
 BR2_or1k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
index eaac058923..63cffef7e8 100644
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
@@ -3,8 +3,8 @@ BR2_powerpc_603e=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
index f4c073779e..83b4c093d3 100644
--- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
+++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
@@ -3,9 +3,9 @@ BR2_powerpc_e500mc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
index 6e31cbb7c7..99ab1695a2 100644
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
index 80d5b3c133..12e3e8fc68 100644
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
index b50e3528b6..884fbc793b 100644
--- a/support/config-fragments/autobuild/br-sh4-full.config
+++ b/support/config-fragments/autobuild/br-sh4-full.config
@@ -2,9 +2,9 @@ BR2_sh=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
index e2a69bb56d..19bce355e5 100644
--- a/support/config-fragments/autobuild/br-sparc-uclibc.config
+++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
@@ -1,7 +1,7 @@
 BR2_sparc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
index c1d272141a..093de54b9b 100644
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -1,7 +1,7 @@
 BR2_sparc64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
index 56e2238731..c1ccddbe20 100644
--- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
+++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
@@ -3,7 +3,7 @@ BR2_x86_core2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
index 48f84cc79a..6ee19ab2ed 100644
--- a/support/config-fragments/autobuild/br-x86-64-musl.config
+++ b/support/config-fragments/autobuild/br-x86-64-musl.config
@@ -3,8 +3,8 @@ BR2_x86_atom=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
index c98b3057cf..23e2b8b7ef 100644
--- a/support/config-fragments/autobuild/br-xtensa-full.config
+++ b/support/config-fragments/autobuild/br-xtensa-full.config
@@ -1,9 +1,9 @@
 BR2_xtensa=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2017.05-1078-g95b1dae.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2017.11-rc1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.13.6
