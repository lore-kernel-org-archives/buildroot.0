From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:37:07 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for PowerPC64le Power8 glibc
Message-ID: <20210203212739.BEFB386C4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15af077d8e0e8c09531dd29a57e3f4eed60eb68f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test PowerPC64le Power8/glibc, use a pre-built Bootlin
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-powerpc64le-power8-glibc.config            | 4 ++++
 .../autobuild/br-powerpc64le-power8-glibc.config                 | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv         | 2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config
new file mode 100644
index 0000000000..44f00963c8
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config
@@ -0,0 +1,4 @@
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
deleted file mode 100644
index b743bbc4a0..0000000000
--- a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_powerpc64le=y
-BR2_powerpc_power8=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 1bb132df3b..8a8aeb5a86 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -34,6 +34,7 @@ support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
@@ -48,7 +49,6 @@ support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
-support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
