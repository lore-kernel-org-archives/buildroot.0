From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:14 +0100
Subject: [Buildroot] [PATCH 01/25] support/config-fragments/autobuild: use
 Bootlin toolchain for AArch64 glibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test AArch64/glibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-aarch64-glibc.config               | 4 ++++
 .../config-fragments/autobuild/br-aarch64-glibc.config   | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv | 2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-aarch64-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-aarch64-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc.config
new file mode 100644
index 0000000000..fe167e23aa
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc.config
@@ -0,0 +1,4 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
deleted file mode 100644
index f1b0f2a91e..0000000000
--- a/support/config-fragments/autobuild/br-aarch64-glibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_aarch64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f84f27ddcd..df9ac3d3ec 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -24,8 +24,8 @@ support/config-fragments/autobuild/sourcery-arm.config,x86
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
+support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
-support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
-- 
2.29.2
