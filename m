From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 08:49:14 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: fix
 SSP in br-nios2-glibc
Message-ID: <20180331064928.C784F83EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e4de0f2db5f7a252d4b8a4cac752fac9ca2deb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c8680956819fae8776d7bd6d1f0e67a7b6436672 ("toolchain: fix
detection of SSP support") fixed the SSP check so that it does the
correct thing for nios2 toolchains. While this commit fixed the
description of the Sourcery NIOSII toolchain, it didn't fix the
description for the autobuilders of the br-nios2-glibc toolchain,
causing some build failures. This commit adjusts br-nios2-glibc.config
to indicate that the toolchain doesn't have SSP support.

Fixes:

  http://autobuild.buildroot.net/results/6c44e328b7bffd8474d29d5bdf1ea109ec15f4ad/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-nios2-glibc.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
index 62f2665e44..52b9f7f9f5 100644
--- a/support/config-fragments/autobuild/br-nios2-glibc.config
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
@@ -6,4 +6,5 @@ BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_13=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
