From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:36:54 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for ARMv5 uclibc
Message-ID: <20210203212739.42FC98635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff203421dbaf90610c47ff0025f3bd256a98ac88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test ARMv5/uclibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-armv5-uclibc.config |  4 ++++
 support/config-fragments/autobuild/br-arm-full.config          | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv       |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-armv5-uclibc.config b/support/config-fragments/autobuild/bootlin-armv5-uclibc.config
new file mode 100644
index 0000000000..c179c75d7a
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-armv5-uclibc.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
deleted file mode 100644
index 652c5a68e5..0000000000
--- a/support/config-fragments/autobuild/br-arm-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_arm=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 82a0bd7f4a..7a7ce4068b 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -4,7 +4,7 @@
 # Toolchains used by default by test-pkg:
 
 # Test a regular uClibc toolchain
-support/config-fragments/autobuild/br-arm-full.config,x86_64
+support/config-fragments/autobuild/bootlin-armv5-uclibc.config,x86_64
 
 # Test a toolchain with glibc and a very recent gcc version
 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
