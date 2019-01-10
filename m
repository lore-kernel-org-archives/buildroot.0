From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:30:21 +0100
Subject: [Buildroot] [git commit] support/config-fragments: add RISC-V
 32-bit to autobuild configs
Message-ID: <20190110203021.A85908B51A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a389a6ec867e89a47b1a7109ddded72e9f01de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a minimal RISC-V 32-bit autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-riscv32-internal-glibc.config | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/support/config-fragments/autobuild/br-riscv32-internal-glibc.config b/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
new file mode 100644
index 0000000000..c5348a28da
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
@@ -0,0 +1,3 @@
+BR2_riscv=y
+BR2_RISCV_32=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f24ec9ced0..3681bc519f 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -51,6 +51,7 @@ support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
+support/config-fragments/autobuild/br-riscv32-internal-glibc.config,any
 support/config-fragments/autobuild/br-riscv64-internal-glibc.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
