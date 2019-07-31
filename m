From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 31 Jul 2019 10:03:19 +0100
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: add RISC-V 64-bit
 musl autobuild config
Message-ID: <20190731090319.21569-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a RISC-V 64-bit autobuild configuration for the internal
toolchain with musl.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 support/config-fragments/autobuild/br-riscv64-musl.config | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv  | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-riscv64-musl.config

diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-musl.config
new file mode 100644
index 0000000000..89e7afb276
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-musl.config
@@ -0,0 +1,3 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 15a69d60ee..da689c5fe7 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -53,6 +53,7 @@ support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
+support/config-fragments/autobuild/br-riscv64-musl.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
-- 
2.19.1
