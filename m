From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:02:49 +0200
Subject: [Buildroot] [git commit] nodm: uClibc wordexp support is enabled by
	default
Message-ID: <20170701075958.E10B081E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659ec7d64d39efac49f5fda4cfa78cd8164cd22a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build tested with Qemu X86 sample.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
