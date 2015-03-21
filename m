From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 21 Mar 2015 16:38:39 +0100
Subject: [Buildroot] [PATCH 4/4] wine: more hostarch
Message-ID: <550D907F.5000106@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tools from host-wine build on those architectures.

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 26de143..d1510e1 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_WINE
 	bool "wine"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Wine only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
+	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
+	           BR2_HOSTARCH = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
 	help
-- 
1.9.1
