From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:17 +0100
Subject: [Buildroot] [PATCH 04/25] support/config-fragments/autobuild: use
 Bootlin toolchain for ARMv7 glibc
In-Reply-To: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210202225339.2157480-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using an external toolchain built specifically for the
autobuilders to test ARM Cortex-A9/glibc, use a pre-built Bootlin
toolchain. Since this was meant to test very recent version of
toolchain components, we use the bleeding edge toolchain variant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-armv7-glibc.config              |  6 ++++++
 .../autobuild/br-arm-cortex-a9-glibc.config           | 11 -----------
 .../config-fragments/autobuild/toolchain-configs.csv  |  2 +-
 3 files changed, 7 insertions(+), 12 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-armv7-glibc.config b/support/config-fragments/autobuild/bootlin-armv7-glibc.config
new file mode 100644
index 0000000000..11ae28ff61
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-armv7-glibc.config
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
deleted file mode 100644
index a3b51138d7..0000000000
--- a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_VFP=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 7a7ce4068b..daaad40db5 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -7,7 +7,7 @@
 support/config-fragments/autobuild/bootlin-armv5-uclibc.config,x86_64
 
 # Test a toolchain with glibc and a very recent gcc version
-support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-armv7-glibc.config,x86_64
 
 # Test a noMMU toolchain with no dynamic library support
 support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
-- 
2.29.2
