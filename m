From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:41:52 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for SH4 uclibc
Message-ID: <20210203212739.E895E8635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e022d479089679078eac14cdef070e8ac20232f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test SH4/uclibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: drop BR2_sh4=y which is the default]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config |  3 +++
 support/config-fragments/autobuild/br-sh4-full.config        | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv     |  2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-sh4-uclibc.config b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
new file mode 100644
index 0000000000..8b4d40b5c7
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
@@ -0,0 +1,3 @@
+BR2_sh=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
deleted file mode 100644
index dc31902874..0000000000
--- a/support/config-fragments/autobuild/br-sh4-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_sh=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 72b7a344c6..be7a2b2ad1 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -37,6 +37,7 @@ support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -57,7 +58,6 @@ support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
