From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:03:18 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: remove
 Blackfin configuration
Message-ID: <20180415200628.9FF918831B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d13c3d178ce7b3e7967e9a5834ae6ed18006f1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the removal of the Blackfin architecture, drop the
autobuilder toolchain configuration that was testing Blackfin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-bfin-full.config   | 12 ------------
 support/config-fragments/autobuild/toolchain-configs.csv |  3 ---
 utils/test-pkg                                           |  2 +-
 3 files changed, 1 insertion(+), 16 deletions(-)

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
