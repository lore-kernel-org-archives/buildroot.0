From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:25 +0100
Subject: [Buildroot] [PATCH 12/25] support/config-fragments/autobuild: use
 Bootlin toolchain for NIOS2 glibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test nios2/glibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-nios2-glibc.config                 | 4 ++++
 support/config-fragments/autobuild/br-nios2-glibc.config | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv | 2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-nios2-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-nios2-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-nios2-glibc.config b/support/config-fragments/autobuild/bootlin-nios2-glibc.config
new file mode 100644
index 0000000000..575a1b30ed
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-nios2-glibc.config
@@ -0,0 +1,4 @@
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
deleted file mode 100644
index c5ac68dc50..0000000000
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_nios2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 489ee792fe..9e65ae5409 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -32,6 +32,7 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -45,7 +46,6 @@ support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-support/config-fragments/autobuild/br-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/br-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
 support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
-- 
2.29.2
