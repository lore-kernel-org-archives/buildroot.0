From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Jun 2016 05:17:20 +0200
Subject: [Buildroot] [PATCH] mongrel2: allow to build for sparc
Message-ID: <20160603031720.GA28367@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With uClibc-ng 1.0.15 sparc support got context functions.
Tested with qemu-system-sparc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mongrel2/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 49dd6fd..bc9b79b 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	bool
 	default y if BR2_TOOLCHAIN_USES_GLIBC
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
-		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_x86_64)
+		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_sparc || BR2_x86_64)
 
 comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-- 
1.7.10.4
