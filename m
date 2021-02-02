From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:19 +0100
Subject: [Buildroot] [PATCH 06/25] support/config-fragments/autobuild: use
 Bootlin toolchain for ARMv7-M uclibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test ARMv7-M/uclibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-armv7m-uclibc.config           |  4 ++++
 .../autobuild/br-arm-cortex-m4-full.config           | 12 ------------
 .../config-fragments/autobuild/toolchain-configs.csv |  2 +-
 3 files changed, 5 insertions(+), 13 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-m4-full.config

diff --git a/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config b/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
new file mode 100644
index 0000000000..8d05409647
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
deleted file mode 100644
index 22e9740e4d..0000000000
--- a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
+++ /dev/null
@@ -1,12 +0,0 @@
-BR2_arm=y
-BR2_cortex_m4=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index b0f3c65a90..bdc43ae2c9 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -10,7 +10,7 @@ support/config-fragments/autobuild/bootlin-armv5-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-armv7-glibc.config,x86_64
 
 # Test a noMMU toolchain with no dynamic library support
-support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
+support/config-fragments/autobuild/bootlin-armv7m-uclibc.config,x86_64
 
 # Test a musl toolchain
 support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
-- 
2.29.2
