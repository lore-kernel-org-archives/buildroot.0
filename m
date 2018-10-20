From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:17:23 +0200
Subject: [Buildroot] [git commit] support/config-fragments: add RISC-V
 64-bit to autobuild configs
Message-ID: <20181020121553.268A983B78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be43be070f9bff3dbc7139b9a719749b46a9d8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a minimal RISC-V 64-bit autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-riscv64-internal-glibc.config | 2 ++
 support/config-fragments/autobuild/toolchain-configs.csv            | 1 +
 2 files changed, 3 insertions(+)

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
