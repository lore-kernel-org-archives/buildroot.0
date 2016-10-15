From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 16:38:05 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: enable Musl for MIPS
	R6
Message-ID: <20161015144058.BDB0D80179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b890bd1f04635f3022461a73bff4ed12d5494e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 310572e..c89e181 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -73,8 +73,6 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 		   BR2_mips64el   || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_sh         || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
-	# Unsupported for MIPS R6
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
 	depends on BR2_USE_MMU
