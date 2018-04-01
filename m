From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:30:30 +0200
Subject: [Buildroot] [git commit] toolchain-configs.csv: re-organize for
 test-pkg
Message-ID: <20180401143040.2060582BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fdd63ad372d7af555c71ae42e0a471c86a0cec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reorganizes the toolchain-configs.csv so that the first
toolchains are a subset of "useful" toolchains to be tested by
contributors to validate a package. This subset is the one that will
be used by default by test-pkg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/toolchain-configs.csv                | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 2010113f44..1bce7ac577 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -1,20 +1,41 @@
+# This file is sorted by "importance" of toolchains, so that by
+# default test-pkg tests a useful subset of toolchains
+
+# Toolchains used by default by test-pkg:
+
+# Test a regular uClibc toolchain
+support/config-fragments/autobuild/br-arm-full.config,x86_64
+
+# Test a toolchain with glibc and a very recent gcc version
+support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
+
+# Test a noMMU toolchain with no dynamic library support
+support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
+
+# Test a musl toolchain
+support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
+
+# Test a noMMU toolchain with dynamic library support
+support/config-fragments/autobuild/br-bfin-full.config,x86_64
+
+# Test a MMU toolchain without dynamic library support
+support/config-fragments/autobuild/br-arm-full-static.config,x86_64
+
+# Test a toolchain with an old gcc version (gcc 4.8)
 support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
+
+# Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
-support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64
-support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
-support/config-fragments/autobuild/br-arm-full.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
-support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
-support/config-fragments/autobuild/br-bfin-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64
@@ -36,7 +57,6 @@ support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
-support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
