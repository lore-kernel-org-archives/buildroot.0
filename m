From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sat, 20 Oct 2018 12:56:51 +0100
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: add RISC-V 64-bit
 to autobuild configs
Message-ID: <20181020115651.6268-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a minimal RISC-V 64-bit autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 .../config-fragments/autobuild/br-riscv64-internal-glibc.config | 2 ++
 support/config-fragments/autobuild/toolchain-configs.csv        | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-riscv64-internal-glibc.config

diff --git a/support/config-fragments/autobuild/br-riscv64-internal-glibc.config b/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
new file mode 100644
index 0000000000..75aa5dd915
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
@@ -0,0 +1,2 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 136a67f54b..d5bba8949e 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -50,6 +50,7 @@ support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
+support/config-fragments/autobuild/br-riscv64-internal-glibc.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
-- 
2.17.1
