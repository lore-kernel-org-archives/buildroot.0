From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Jun 2016 05:15:53 +0200
Subject: [Buildroot] [PATCH] libsigsegv: enable for sparc
Message-ID: <20160603031553.GA28275@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that uClibc-ng 1.0.15 is in use, we can reenable
this package as context functions are available.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libsigsegv/Config.in |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index e96ba5f..e5224da 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
-	# No ucontext support in uclibc for powerpc, sparc and superh
-	depends on !((BR2_powerpc || BR2_sh || BR2_sparc ) && BR2_TOOLCHAIN_USES_UCLIBC)
+	# No ucontext support in uclibc for powerpc and superh
+	depends on !((BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  Library for handling page faults in user mode.
 
 	  http://libsigsegv.sourceforge.net/
 
 comment "libsigsegv needs an (e)glibc toolchain"
-	depends on (BR2_powerpc || BR2_sh || BR2_sparc) && BR2_TOOLCHAIN_USES_UCLIBC
+	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
-- 
1.7.10.4
