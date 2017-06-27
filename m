From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Jun 2017 21:07:43 +0200
Subject: [Buildroot] [PATCH] nodm: uClibc wordexp support is enabled by
	default
Message-ID: <20170627190743.GA3908@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build tested with Qemu X86 sample.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nodm/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index 97ce8c3..38171e8 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_NODM
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs wordexp.h
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
@@ -19,8 +18,7 @@ config BR2_PACKAGE_NODM
 
 	  https://github.com/spanezz/nodm/
 
-comment "nodm needs a glibc toolchain w/ wchar, locale, dynamic library"
+comment "nodm needs a glibc or uClibc toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_XORG7
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL \
-		|| BR2_TOOLCHAIN_USES_UCLIBC
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.1.4
