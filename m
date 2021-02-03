From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:02 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for mipsel32r6 glibc
Message-ID: <20210203212739.940B48635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=577ddc907f9a7993819157d0723fdcd6d7d6b0ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test mipsel32r6/glibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-mipsel32r6-glibc.config                 |  6 ++++++
 .../config-fragments/autobuild/br-mips32r6-el-hf-glibc.config | 11 -----------
 support/config-fragments/autobuild/toolchain-configs.csv      |  2 +-
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config b/support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config
new file mode 100644
index 0000000000..58a50121a0
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config
@@ -0,0 +1,6 @@
+BR2_mipsel=y
+BR2_mips_32r6=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
deleted file mode 100644
index ce61100a37..0000000000
--- a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_mipsel=y
-BR2_mips_32r6=y
-# BR2_MIPS_SOFT_FLOAT is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 984fc778d6..786afc21c1 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -30,6 +30,7 @@ support/config-fragments/autobuild/bootlin-armv7-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -42,7 +43,6 @@ support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
-support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-mipsel-o32-full.config,x86_64
 support/config-fragments/autobuild/br-nios2-glibc.config,x86_64
