From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 18:00:17 +0200
Subject: [Buildroot] [git commit] support/config-fragments: use external
 riscv64 musl toolchain
Message-ID: <20200727155526.D7BCF8216C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=468f728dcb5f5666827f364653fc4c8d5814c0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move to an external RISC-V 64 bit musl toolchain to ease the load
on the autobuilders.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../config-fragments/autobuild/br-riscv64-internal-musl.config   | 3 ---
 support/config-fragments/autobuild/br-riscv64-musl.config        | 9 +++++++++
 support/config-fragments/autobuild/toolchain-configs.csv         | 2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/br-riscv64-internal-musl.config b/support/config-fragments/autobuild/br-riscv64-internal-musl.config
deleted file mode 100644
index 89e7afb276..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-internal-musl.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_BUILDROOT_MUSL=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-musl.config
new file mode 100644
index 0000000000..fd6ef822aa
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-musl.config
@@ -0,0 +1,9 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-musl-2020.02.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 8511da4ac1..7f05064475 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -54,7 +54,7 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
-support/config-fragments/autobuild/br-riscv64-internal-musl.config,any
+support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
