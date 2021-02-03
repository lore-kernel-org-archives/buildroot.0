From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:42:39 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for SPARC64 glibc
Message-ID: <20210203212740.07AE98635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e56f77fdfa14475fe2018de80a11a9ff4b9ef9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test SPARC64/glibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config | 3 +++
 support/config-fragments/autobuild/br-sparc64-glibc.config      | 8 --------
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-sparc64-glibc.config b/support/config-fragments/autobuild/bootlin-sparc64-glibc.config
new file mode 100644
index 0000000000..4f851d105a
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-sparc64-glibc.config
@@ -0,0 +1,3 @@
+BR2_sparc64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
deleted file mode 100644
index 0b77bb45fa..0000000000
--- a/support/config-fragments/autobuild/br-sparc64-glibc.config
+++ /dev/null
@@ -1,8 +0,0 @@
-BR2_sparc64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 0c9299373a..a475958b94 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -39,6 +39,7 @@ support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -59,7 +60,6 @@ support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
