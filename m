From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:34:44 +0200
Subject: [Buildroot] [git commit] libsigsegv: mark as not available on m68k
Message-ID: <20160706193511.956A482233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=755d6cb0fef6cdce43608cde980686f247033a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/059fd862bd3e9456783f2f4ba307df15dbab0d41/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigsegv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index a420474..1f41f0d 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
+	depends on !BR2_m68k # unknown type name 'ucontext_t'
 	# No ucontext support in uclibc for powerpc and superh
 	depends on !((BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
