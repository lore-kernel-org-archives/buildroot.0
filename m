From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 18:00:17 +0200
Subject: [Buildroot] [git commit] support/config-fragments: add RISC-V
 64-bit uclibc autobuild config
Message-ID: <20200727155526.C953D81534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c79a4d87729e960a4ce915df48557768d53535bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a RISC-V 64-bit autobuild configuration for the internal
toolchain with uclibc.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-riscv64-full-internal.config | 4 ++++
 support/config-fragments/autobuild/toolchain-configs.csv           | 1 +
 2 files changed, 5 insertions(+)

diff --git a/support/config-fragments/autobuild/br-riscv64-full-internal.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
new file mode 100644
index 0000000000..5c1dfc47e3
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-full-internal.config
@@ -0,0 +1,4 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 9b41e2173b..8511da4ac1 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -53,6 +53,7 @@ support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
+support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-internal-musl.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
