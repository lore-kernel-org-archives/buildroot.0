From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 20:58:29 +0200
Subject: [Buildroot] [git commit] glibc: drop redundant arch depends
Message-ID: <20140601200640.EB7E09CE46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94df3e6d1bcad61e8e4cced672501e0b26f1f297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are already in toolchain/toolchain-buildroot/Config.in and since
package/glibc/Config.in is filtered by BR2_TOOLCHAIN_USES_GLIBC there's
no need to duplicate this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d1ad3de..dbb1a19 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -3,13 +3,6 @@ if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 choice
 	prompt "glibc version"
 	default BR2_GLIBC_VERSION_2_18
-	# Architectures supported in mainline glibc
-	depends on BR2_arm         || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
-		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
-		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \\
-		   BR2_microblaze
 
 config BR2_GLIBC_VERSION_2_18
 	bool "2.18"
