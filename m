From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:09 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for RISC-V 32 glibc
Message-ID: <20210203212739.DEB9C86C4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc266b1c1a9e1b217893a320becda2afb50e17db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test RISC-V 32/glibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config | 5 +++++
 support/config-fragments/autobuild/br-riscv32.config            | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 +-
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-riscv32-glibc.config b/support/config-fragments/autobuild/bootlin-riscv32-glibc.config
new file mode 100644
index 0000000000..cc45d01824
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-riscv32-glibc.config
@@ -0,0 +1,5 @@
+BR2_riscv=y
+BR2_RISCV_32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
deleted file mode 100644
index d9110a6a86..0000000000
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_riscv=y
-BR2_RISCV_32=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index fba8489c3c..72b7a344c6 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -36,6 +36,7 @@ support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -52,7 +53,6 @@ support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
-support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
