From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:30 +0100
Subject: [Buildroot] [PATCH 17/25] support/config-fragments/autobuild: use
 Bootlin toolchain for RISC-V 64 glibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-18-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test RISC-V 64/glibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-riscv64-glibc.config                | 5 +++++
 support/config-fragments/autobuild/br-riscv64.config      | 8 --------
 support/config-fragments/autobuild/toolchain-configs.csv  | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-riscv64-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64.config

diff --git a/support/config-fragments/autobuild/bootlin-riscv64-glibc.config b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
new file mode 100644
index 0000000000..f6c6fcaa36
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-riscv64-glibc.config
@@ -0,0 +1,5 @@
+BR2_riscv=y
+BR2_RISCV_ABI_LP64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
deleted file mode 100644
index c5df86392c..0000000000
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ /dev/null
@@ -1,8 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 72b7a344c6..04a248e03d 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -37,6 +37,7 @@ support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-riscv64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -53,7 +54,6 @@ support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
-support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-- 
2.29.2
