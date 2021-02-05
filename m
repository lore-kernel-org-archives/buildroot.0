From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 09:27:37 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for RISC-V 64 musl
Message-ID: <20210205080943.89DFC811E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1c036060663805c6e1e5b5c571e2396bfeb47fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test RISC-V 64/musl, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-riscv64-musl.config | 4 ++++
 support/config-fragments/autobuild/br-riscv64-musl.config      | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv       | 2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-riscv64-musl.config b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
new file mode 100644
index 0000000000..2b6a6e56da
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-riscv64-musl.config
@@ -0,0 +1,4 @@
+BR2_riscv=y
+BR2_RISCV_ABI_LP64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-musl.config
deleted file mode 100644
index fd6ef822aa..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-musl.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-musl-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 75393c381d..f5e9bd8cf9 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -38,6 +38,7 @@ support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_6
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
@@ -60,7 +61,6 @@ support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
-support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
