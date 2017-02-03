From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Feb 2017 20:58:56 +0100
Subject: [Buildroot] [git commit] uclibc: allow to build aarch64 internal
	toolchain
Message-ID: <20170203200312.2462481979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00995e0e49fafc355fbf56d9b7810c1696a41b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc-ng from 1.0.22 and up supports aarch64 architecture.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index a46b65e..91cddc2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -23,13 +23,13 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
-		|| BR2_powerpc64
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
 	select BR2_TOOLCHAIN_USES_UCLIBC
-	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
+	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
+		   BR2_arm     || BR2_armeb    || \
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
