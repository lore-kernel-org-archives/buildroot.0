From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 4 Dec 2015 17:53:30 +0100
Subject: [Buildroot] [PATCH] openvmtools: enable for uClibc toolchains
Message-ID: <20151204165330.GA5268@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since uClibc-ng 1.0.9 openvmtools can be compiled as
the missing euidaccess function was added.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openvmtools/Config.in |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 64bf65c..528ddbe 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
 	help
@@ -41,14 +40,13 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs an (e)glibc toolchain w/ dynamic library"
+comment "PAM support needs an (e)glibc or uClibc toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 endif
 
-comment "openvmtools needs an (e)glibc or musl toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
-		BR2_TOOLCHAIN_USES_UCLIBC
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
-- 
1.7.10.4
