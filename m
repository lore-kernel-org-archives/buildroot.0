From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2015 14:23:53 +0200
Subject: [Buildroot] [PATCH] package/freerdp: needs threads
Message-ID: <1428150233-21031-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/0b7/0b71e37b8891b3b8810d1e74445177a1099b59f3/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 445bc2d..2e879b4 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -40,5 +41,6 @@ comment "freerdp server and client need X.Org"
 
 endif
 
-comment "freerdp needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "freerdp needs a toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
