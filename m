From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:08 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for PowerPC e500mc uclibc
Message-ID: <20210203212739.D4D818635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=563285a63aeba2f942821ba403b84f1110a195eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test PowerPC e500mc/uclibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-powerpc-e500mc-uclibc.config            |  4 ++++
 .../config-fragments/autobuild/br-powerpc-e500mc-full.config  | 11 -----------
 support/config-fragments/autobuild/toolchain-configs.csv      |  2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config b/support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config
new file mode 100644
index 0000000000..96461856fb
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config
@@ -0,0 +1,4 @@
+BR2_powerpc=y
+BR2_powerpc_e500mc=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
deleted file mode 100644
index c5edcc177d..0000000000
--- a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_e500mc=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 8a8aeb5a86..fba8489c3c 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -35,6 +35,7 @@ support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -50,7 +51,6 @@ support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
-support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
