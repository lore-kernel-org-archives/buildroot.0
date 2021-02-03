From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:03 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for mipsel uclibc
Message-ID: <20210203212739.A1D728635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=625cbe23b3e8a32326d001a388ff9d7242afbea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test mipsel/uclibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../config-fragments/autobuild/bootlin-mipsel-uclibc.config    |  4 ++++
 support/config-fragments/autobuild/br-mipsel-o32-full.config   | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv       |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-mipsel-uclibc.config b/support/config-fragments/autobuild/bootlin-mipsel-uclibc.config
new file mode 100644
index 0000000000..ff523b258a
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-mipsel-uclibc.config
@@ -0,0 +1,4 @@
+BR2_mipsel=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
deleted file mode 100644
index 6099e48869..0000000000
--- a/support/config-fragments/autobuild/br-mipsel-o32-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_mipsel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 786afc21c1..489ee792fe 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -30,6 +30,7 @@ support/config-fragments/autobuild/bootlin-armv7-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
@@ -44,7 +45,6 @@ support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-support/config-fragments/autobuild/br-mipsel-o32-full.config,x86_64
 support/config-fragments/autobuild/br-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/br-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
