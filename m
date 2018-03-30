From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:21:13 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] support/config-fragments:
 add internal defconfigs for glibc and musl
Message-ID: <20180330193200.6B11C83EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac771f06b046270bc19b741e8d0ca9037bbf6dfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

While we have several defconfigs building internal toolchains with
uClibc, we don't have any building internal toolchain with glibc and
musl. However, having such defconfigs is nice when we bump the C
library version, in order to immediately get feedback on build
failures.

Note that while the ARC internal defconfig uses glibc, it uses the
special ARC glibc version, so it doesn't test version bumps of the
upstream glibc C library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6030986311434d554635761925925bfd351b836b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 4 ++++
 support/config-fragments/autobuild/br-arm-internal-musl.config  | 4 ++++
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
new file mode 100644
index 0000000000..6b2566eedc
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-internal-musl.config b/support/config-fragments/autobuild/br-arm-internal-musl.config
new file mode 100644
index 0000000000..92788626d6
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-internal-musl.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index efb78eec4f..2010113f44 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -12,6 +12,8 @@ support/config-fragments/autobuild/br-arm-full.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-full.config,any
+support/config-fragments/autobuild/br-arm-internal-glibc.config,any
+support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-bfin-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
