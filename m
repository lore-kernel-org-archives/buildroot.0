From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:42:39 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for x86-64 musl
Message-ID: <20210203212740.1BE3686C4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bed28e9967c03540fde11f4a1be8b4f45eb6418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test x86-64/musl, use a pre-built Bootlin toolchain.

The previous configuration was for an Atom platform, but the Bootlin
toolchains only provide a Core i7 configuration. Since this is close
enough, we change to use this Core i7 configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-x86-64-musl.config |  4 ++++
 support/config-fragments/autobuild/br-x86-64-musl.config      | 10 ----------
 support/config-fragments/autobuild/toolchain-configs.csv      |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-x86-64-musl.config b/support/config-fragments/autobuild/bootlin-x86-64-musl.config
new file mode 100644
index 0000000000..9763d8a6a8
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-x86-64-musl.config
@@ -0,0 +1,4 @@
+BR2_x86_64=y
+BR2_x86_corei7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE=y
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
deleted file mode 100644
index 03de24d354..0000000000
--- a/support/config-fragments/autobuild/br-x86-64-musl.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_64=y
-BR2_x86_atom=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 6c1e5818cd..36de0168d8 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -13,7 +13,7 @@ support/config-fragments/autobuild/bootlin-armv7-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config,x86_64
 
 # Test a musl toolchain
-support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
+support/config-fragments/autobuild/bootlin-x86-64-musl.config,x86_64
 
 # Test a MMU toolchain without dynamic library support
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
