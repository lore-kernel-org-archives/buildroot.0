From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:09:32 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 support/config-fragments/autobuild/bootlin-x86-64-glibc: use
 toolchain-external-bootlin
Message-ID: <20210119135627.47EE781275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ed3a10184e80e29160f2859352aabd705e7edc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Until now the bootlin-x86-64-glibc was using a Bootlin toolchain as a
custom external toolchain. However, now that we have the
toolchain-external-bootlin package explicitly supporting Bootlin
toolchains as known toolchain profiles, it makes sense to use
that. Indeed, this will ensure that this autobuilder configuration
will use the latest available version of the Buildroot toolchain for
x86-64 glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01533244a59ae67323ce11e43be4494d0b35f0f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../config-fragments/autobuild/bootlin-x86-64-glibc.config | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
index 6a372803b2..815eb658e0 100644
--- a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
+++ b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
@@ -1,15 +1,5 @@
 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2020.02-2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
-# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
-BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
-BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
