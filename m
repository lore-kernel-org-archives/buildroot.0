From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:18 +0100
Subject: [Buildroot] [PATCH 05/25] support/config-fragments/autobuild: use
 Bootlin toolchain for ARMv7 musl
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test ARMv7/musl, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-armv7-musl.config               |  6 ++++++
 .../autobuild/br-arm-cortex-a9-musl.config            | 11 -----------
 .../config-fragments/autobuild/toolchain-configs.csv  |  2 +-
 3 files changed, 7 insertions(+), 12 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config

diff --git a/support/config-fragments/autobuild/bootlin-armv7-musl.config b/support/config-fragments/autobuild/bootlin-armv7-musl.config
new file mode 100644
index 0000000000..7ae72b21c5
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-armv7-musl.config
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
deleted file mode 100644
index e6a5fa64f0..0000000000
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_VFP=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index daaad40db5..b0f3c65a90 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -26,11 +26,11 @@ support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-armv7-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
-support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
-- 
2.29.2
