From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:36:53 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for ARCle HS38 uclibc
Message-ID: <20210203212739.3B91F8139F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbba59f4780cad0c3c41388ea76a80d26e5eb069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test ARCle HS38/uclibc, use a pre-built Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../autobuild/bootlin-arcle-hs38-uclibc.config                |  5 +++++
 support/config-fragments/autobuild/br-arcle-hs38.config       | 11 -----------
 support/config-fragments/autobuild/toolchain-configs.csv      |  2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config b/support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config
new file mode 100644
index 0000000000..c9e1d19e49
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config
@@ -0,0 +1,5 @@
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
deleted file mode 100644
index f8287ccd0f..0000000000
--- a/support/config-fragments/autobuild/br-arcle-hs38.config
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_arcle=y
-BR2_archs38=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index df9ac3d3ec..82a0bd7f4a 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -25,10 +25,10 @@ support/config-fragments/autobuild/sourcery-arm.config,x86
 support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
-support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
