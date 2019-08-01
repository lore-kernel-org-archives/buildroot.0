From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 23:55:40 +0200
Subject: [Buildroot] [git commit] support/config-fragments: add RISC-V
 64-bit musl autobuild config
Message-ID: <20190801215306.97DD28C6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1003af2ebebd7043e9c03b3368b90399c71eb183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a RISC-V 64-bit autobuild configuration for the internal
toolchain with musl.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-riscv64-musl.config | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv  | 1 +
 2 files changed, 4 insertions(+)

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
