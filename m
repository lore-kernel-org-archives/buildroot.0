From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 18:39:31 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: musl only supports
 64bit variant of risc-v
Message-ID: <20190730163750.3E0FB828BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70f72c8022e5d093c4b579389fcebf98eb017e31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index b4168bd40c..c0612bf041 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -84,7 +84,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
 		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
 		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_riscv || BR2_sh      || BR2_x86_64
+		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
