From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:01 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for Microblaze EL uclibc
Message-ID: <20210203212739.8B87F8635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=899e3747306b5cc0a0a09ae312b003fedeb611e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test Microblaze EL/uclibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-microblazeel-uclibc.config                 | 3 +++
 support/config-fragments/autobuild/br-microblazeel-full.config   | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv         | 2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config b/support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config
new file mode 100644
index 0000000000..206fb777fe
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config
@@ -0,0 +1,3 @@
+BR2_microblazeel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
deleted file mode 100644
index 60c23a202d..0000000000
--- a/support/config-fragments/autobuild/br-microblazeel-full.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_microblazeel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index b0da94d99a..984fc778d6 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -29,6 +29,7 @@ support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-armv7-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -39,7 +40,6 @@ support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
-support/config-fragments/autobuild/br-microblazeel-full.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config,x86_64
