From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:06 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for OpenRISC uclibc
Message-ID: <20210203212739.B4DF386C4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739cb9c9d5ad13979ed69aafbf2cf27b89b5c466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test OpenRISC/uclibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../config-fragments/autobuild/bootlin-openrisc-uclibc.config    | 3 +++
 support/config-fragments/autobuild/br-openrisc-uclibc.config     | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv         | 2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-openrisc-uclibc.config b/support/config-fragments/autobuild/bootlin-openrisc-uclibc.config
new file mode 100644
index 0000000000..bad086274b
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-openrisc-uclibc.config
@@ -0,0 +1,3 @@
+BR2_or1k=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
deleted file mode 100644
index c5391338c0..0000000000
--- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_or1k=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2020.02-500-geee96b0.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 9e65ae5409..1bb132df3b 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -33,6 +33,7 @@ support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -46,7 +47,6 @@ support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-support/config-fragments/autobuild/br-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
