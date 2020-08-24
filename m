From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 23:36:25 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: test
 Bootlin x86-64 toolchain
Message-ID: <20200824213005.E6B548461A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b464d73e0d8dcd6fe8495a8d57b3d553424b9de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we recently stopped testing the x86-64 Sourcery toolchain, it means
we no longer have any x86-64 glibc based toolchain in our
autobuilders. Since this is a pretty common configuration, it makes
sense to test it, which this commit does by adding a config fragment
to use the x86-64 glibc bleeding edge Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-x86-64-glibc.config                 | 15 +++++++++++++++
 support/config-fragments/autobuild/toolchain-configs.csv  |  1 +
 2 files changed, 16 insertions(+)

diff --git a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
new file mode 100644
index 0000000000..6a372803b2
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
@@ -0,0 +1,15 @@
+BR2_x86_64=y
+BR2_x86_corei7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2020.02-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
+BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
+BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index eaaac3d24b..5b8b9da7e7 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -24,6 +24,7 @@ support/config-fragments/autobuild/sourcery-arm.config,x86
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
+support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
