From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:35 +0100
Subject: [Buildroot] [PATCH 22/25] support/config-fragments/autobuild: use
 Bootlin toolchain for x86-64 uclibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-23-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test x86-64/uclibc, use a pre-built Bootlin toolchain.

The previous configuration was for Core2 platform, but the Bootlin
toolchains only provide a Core i7 configuration. Since this is close
enough, we change to use this Core i7 configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-x86-64-uclibc.config            |  4 ++++
 .../autobuild/br-x86-64-core2-full.config             | 11 -----------
 .../config-fragments/autobuild/toolchain-configs.csv  |  2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config
 delete mode 100644 support/config-fragments/autobuild/br-x86-64-core2-full.config

diff --git a/support/config-fragments/autobuild/bootlin-x86-64-uclibc.config b/support/config-fragments/autobuild/bootlin-x86-64-uclibc.config
new file mode 100644
index 0000000000..70b940f198
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-x86-64-uclibc.config
@@ -0,0 +1,4 @@
+BR2_x86_64=y
+BR2_x86_corei7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
deleted file mode 100644
index b6682da202..0000000000
--- a/support/config-fragments/autobuild/br-x86-64-core2-full.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_x86_64=y
-BR2_x86_core2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 5fbfd71304..6223c9e992 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -43,6 +43,7 @@ support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
@@ -60,7 +61,6 @@ support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
-- 
2.29.2
