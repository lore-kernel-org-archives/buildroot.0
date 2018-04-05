From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:15 +0200
Subject: [Buildroot] [PATCH 01/23] support/config-fragments/autobuild:
 remove Blackfin configuration
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the removal of the Blackfin architecture, drop the
autobuilder toolchain configuration that was testing Blackfin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-bfin-full.config   | 12 ------------
 support/config-fragments/autobuild/toolchain-configs.csv |  3 ---
 utils/test-pkg                                           |  2 +-
 3 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-bfin-full.config

diff --git a/support/config-fragments/autobuild/br-bfin-full.config b/support/config-fragments/autobuild/br-bfin-full.config
deleted file mode 100644
index eeefcefbee..0000000000
--- a/support/config-fragments/autobuild/br-bfin-full.config
+++ /dev/null
@@ -1,12 +0,0 @@
-BR2_bfin=y
-BR2_bf512=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2017.11-rc1.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 1bce7ac577..64abfb3fd4 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -15,9 +15,6 @@ support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
 # Test a musl toolchain
 support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
 
-# Test a noMMU toolchain with dynamic library support
-support/config-fragments/autobuild/br-bfin-full.config,x86_64
-
 # Test a MMU toolchain without dynamic library support
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 
diff --git a/utils/test-pkg b/utils/test-pkg
index 2e069b6005..54951276fa 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -75,7 +75,7 @@ main() {
     # Default mode is to test the N first toolchains, which have been
     # chosen to be a good selection of toolchains.
     if [ ${mode} -eq 0 ] ; then
-        number=7
+        number=6
     elif [ ${mode} -gt 1 ] ; then
         printf "error: --all, --number and --random are mutually exclusive\n" >&2; exit 1
     fi
-- 
2.14.3
