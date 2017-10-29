From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:14:38 +0100
Subject: [Buildroot] [PATCH 3/5] toolchain-configs.csv: re-organize for
	test-pkg
In-Reply-To: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029171440.8095-4-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit reorganizes the toolchain-configs.csv so that the first
toolchains are a subset of "useful" toolchains to be tested by
contributors to validate a package. This subset is the one that will
be used by default by test-pkg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../autobuild/toolchain-configs.csv                | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index efb78eec4f..53d1d7234a 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -1,18 +1,37 @@
+# This file is sorted by "importance" of toolchains, so that by
+# default test-pkg tests a useful subset of toolchains
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
+# All other toolchains
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
-support/config-fragments/autobuild/br-bfin-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
 support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64
@@ -34,7 +53,6 @@ support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
-support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
-- 
2.13.6
