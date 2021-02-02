From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:34 +0100
Subject: [Buildroot] [PATCH 21/25] support/config-fragments/autobuild: use
 Bootlin toolchain for SPARC64 glibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-22-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test SPARC64/glibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-sparc64-glibc.config                | 3 +++
 .../config-fragments/autobuild/br-sparc64-glibc.config    | 8 --------
 support/config-fragments/autobuild/toolchain-configs.csv  | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-sparc64-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-sparc64-glibc.config

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
index c2bbcb045e..5fbfd71304 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -41,6 +41,7 @@ support/config-fragments/autobuild/bootlin-riscv64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -59,7 +60,6 @@ support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-- 
2.29.2
