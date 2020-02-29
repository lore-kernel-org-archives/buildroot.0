From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 28 Feb 2020 17:31:16 -0700
Subject: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: add
 x86_64 glibc debug toolchain
Message-ID: <20200229003116.115081-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain config helps to catch build issues that are only
reproducible when building with a debug optimizations enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../autobuild/br-x86-64-internal-glibc-debug.config          | 5 +++++
 support/config-fragments/autobuild/toolchain-configs.csv     | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config

diff --git a/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config b/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config
new file mode 100644
index 0000000000..7cf6238471
--- /dev/null
+++ b/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config
@@ -0,0 +1,5 @@
+BR2_x86_64=y
+BR2_OPTIMIZE_G=y
+BR2_ENABLE_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 9b41e2173b..a2cd4a6768 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -57,6 +57,7 @@ support/config-fragments/autobuild/br-riscv64-internal-musl.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
+support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-- 
2.20.1
