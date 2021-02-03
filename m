From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:36:59 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for m68k 68040 uclibc
Message-ID: <20210203212739.785668635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0ab9611a0e99175647b260f5fdf8bdbb3e8bcfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test m68k 68040/uclibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-m68k-68040-uclibc.config                 |  4 ++++
 support/config-fragments/autobuild/br-m68k-68040-full.config   | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv       |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config b/support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config
new file mode 100644
index 0000000000..f2c59e9de7
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config
@@ -0,0 +1,4 @@
+BR2_m68k=y
+BR2_m68k_68040=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
deleted file mode 100644
index 9f600acf46..0000000000
--- a/support/config-fragments/autobuild/br-m68k-68040-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_m68k=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index bdc43ae2c9..4078181485 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -27,6 +27,7 @@ support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-armv7-musl.config,x86_64
+support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -38,7 +39,6 @@ support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64
-support/config-fragments/autobuild/br-m68k-68040-full.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
