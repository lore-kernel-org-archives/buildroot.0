From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Aug 2019 22:51:47 +0200
Subject: [Buildroot] [PATCH 2/3] support/config-fragments/autobuild: update
 toolchains to 2019.05.1
In-Reply-To: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
References: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190802205149.28342-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All toolchains have been rebuilt with Buildroot 2019.05.1. A number of
toolchains are now using Linux headers 5.1 instead of 4.19, because
5.1 is now the default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-aarch64-glibc.config    | 2 +-
 support/config-fragments/autobuild/br-arcle-hs38.config       | 2 +-
 support/config-fragments/autobuild/br-arm-basic.config        | 4 ++--
 .../config-fragments/autobuild/br-arm-cortex-a9-glibc.config  | 4 ++--
 .../config-fragments/autobuild/br-arm-cortex-a9-musl.config   | 4 ++--
 .../config-fragments/autobuild/br-arm-cortex-m4-full.config   | 4 ++--
 .../config-fragments/autobuild/br-arm-full-nothread.config    | 4 ++--
 support/config-fragments/autobuild/br-arm-full-static.config  | 2 +-
 support/config-fragments/autobuild/br-arm-full.config         | 2 +-
 .../autobuild/br-i386-pentium-mmx-musl.config                 | 2 +-
 .../config-fragments/autobuild/br-i386-pentium4-full.config   | 2 +-
 support/config-fragments/autobuild/br-m68k-5208-full.config   | 4 ++--
 support/config-fragments/autobuild/br-m68k-68040-full.config  | 4 ++--
 .../config-fragments/autobuild/br-microblazeel-full.config    | 2 +-
 .../config-fragments/autobuild/br-mips32r6-el-hf-glibc.config | 4 ++--
 support/config-fragments/autobuild/br-mips64-n64-full.config  | 4 ++--
 .../config-fragments/autobuild/br-mips64r6-el-hf-glibc.config | 4 ++--
 support/config-fragments/autobuild/br-mipsel-o32-full.config  | 4 ++--
 support/config-fragments/autobuild/br-nios2-glibc.config      | 4 ++--
 .../autobuild/br-powerpc-603e-basic-cpp.config                | 4 ++--
 .../config-fragments/autobuild/br-powerpc-e500mc-full.config  | 4 ++--
 .../autobuild/br-powerpc64-power7-glibc.config                | 4 ++--
 .../autobuild/br-powerpc64le-power8-glibc.config              | 4 ++--
 support/config-fragments/autobuild/br-riscv32.config          | 4 ++--
 support/config-fragments/autobuild/br-riscv64.config          | 4 ++--
 support/config-fragments/autobuild/br-sh4-full.config         | 4 ++--
 support/config-fragments/autobuild/br-sparc-uclibc.config     | 2 +-
 support/config-fragments/autobuild/br-sparc64-glibc.config    | 2 +-
 .../config-fragments/autobuild/br-x86-64-core2-full.config    | 4 ++--
 support/config-fragments/autobuild/br-x86-64-musl.config      | 4 ++--
 support/config-fragments/autobuild/br-xtensa-full.config      | 4 ++--
 31 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
index 048c27d6cd..42b1c3316c 100644
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
index 0832ddd305..eeec8f38e6 100644
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
@@ -3,7 +3,7 @@ BR2_archs38=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index c576b248b8..6f7c0ce138 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
index 63fb66983e..ab1c904bfd 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
index 3a1499e32f..8f96b3c10f 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
index 36f1647730..327b490f7d 100644
--- a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
+++ b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
@@ -3,9 +3,9 @@ BR2_cortex_m4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index a777d24e66..8215d0a6f9 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,9 +3,9 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index 2e41e0b340..f1ec1cb1a0 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
index 7462706a0a..f27cc65619 100644
--- a/support/config-fragments/autobuild/br-arm-full.config
+++ b/support/config-fragments/autobuild/br-arm-full.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
index fa91cfefed..d177f5aed6 100644
--- a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
+++ b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
@@ -2,7 +2,7 @@ BR2_x86_pentium_mmx=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
index bf0d4165c8..cd359d7910 100644
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ b/support/config-fragments/autobuild/br-i386-pentium4-full.config
@@ -2,7 +2,7 @@ BR2_x86_pentium4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-m68k-5208-full.config b/support/config-fragments/autobuild/br-m68k-5208-full.config
index f75cf3ac5f..25c7f10de5 100644
--- a/support/config-fragments/autobuild/br-m68k-5208-full.config
+++ b/support/config-fragments/autobuild/br-m68k-5208-full.config
@@ -2,9 +2,9 @@ BR2_m68k=y
 BR2_m68k_cf5208=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
index 1bb6aeb8b6..089b8f14fb 100644
--- a/support/config-fragments/autobuild/br-m68k-68040-full.config
+++ b/support/config-fragments/autobuild/br-m68k-68040-full.config
@@ -1,9 +1,9 @@
 BR2_m68k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
index 035cb72e8e..2ddfb69762 100644
--- a/support/config-fragments/autobuild/br-microblazeel-full.config
+++ b/support/config-fragments/autobuild/br-microblazeel-full.config
@@ -1,7 +1,7 @@
 BR2_microblazeel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
index 7454a4da23..d5f60b6f28 100644
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
@@ -4,8 +4,8 @@ BR2_mips_32r6=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
index 3f2e5d9ba2..3b95c2a9d7 100644
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ b/support/config-fragments/autobuild/br-mips64-n64-full.config
@@ -3,8 +3,8 @@ BR2_MIPS_NABI64=y
 # BR2_MIPS_SOFT_FLOAT is not set
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
index b47b434168..d9c544c62b 100644
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
@@ -5,8 +5,8 @@ BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
index 6cf919b1e1..87884e0076 100644
--- a/support/config-fragments/autobuild/br-mipsel-o32-full.config
+++ b/support/config-fragments/autobuild/br-mipsel-o32-full.config
@@ -2,9 +2,9 @@ BR2_mipsel=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index e25ea65a35..cbef0bd74d 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -2,9 +2,9 @@ BR2_nios2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
index 0f19616ab2..dec7b7f681 100644
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
@@ -3,8 +3,8 @@ BR2_powerpc_603e=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
index 1673adbc00..e116daadee 100644
--- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
+++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
@@ -3,9 +3,9 @@ BR2_powerpc_e500mc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
index fb51593412..48686bbcf8 100644
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
index 964a13e2b3..c12e06e195 100644
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
@@ -2,8 +2,8 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index 9565a0b70b..c64dd79b4d 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -2,7 +2,7 @@ BR2_riscv=y
 BR2_RISCV_32=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-2019.02-rc1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.05.1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index 61912cfd7b..4c156e9e34 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -1,7 +1,7 @@
 BR2_riscv=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-2019.02-rc1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.05.1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
index 3651fb6ee7..a2c7d0fed7 100644
--- a/support/config-fragments/autobuild/br-sh4-full.config
+++ b/support/config-fragments/autobuild/br-sh4-full.config
@@ -2,9 +2,9 @@ BR2_sh=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
index d6b8d69e60..13e81804a2 100644
--- a/support/config-fragments/autobuild/br-sparc-uclibc.config
+++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
@@ -1,7 +1,7 @@
 BR2_sparc=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
index a4d1cc6688..293d477c95 100644
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -1,7 +1,7 @@
 BR2_sparc64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
index 29ac6891f6..7220244442 100644
--- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
+++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
@@ -3,9 +3,9 @@ BR2_x86_core2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
index 595d968f3c..7d673f42ec 100644
--- a/support/config-fragments/autobuild/br-x86-64-musl.config
+++ b/support/config-fragments/autobuild/br-x86-64-musl.config
@@ -3,8 +3,8 @@ BR2_x86_atom=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
index bd531abbf1..4057e624db 100644
--- a/support/config-fragments/autobuild/br-xtensa-full.config
+++ b/support/config-fragments/autobuild/br-xtensa-full.config
@@ -1,9 +1,9 @@
 BR2_xtensa=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2019.05.1.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.21.0
