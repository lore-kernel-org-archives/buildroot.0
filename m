From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:23:58 +0100
Subject: [Buildroot] [git commit] wine: Drop glibc requirement
Message-ID: <20180311212514.449DB82E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bc71f825dae8b2605a3617b929f827946c81ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I noticed it's not needed anymore, musl went upstream at some point and uClibc is now build with bessel functions:
https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index c674288446..627a9a71f4 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_WINE
 	bool "wine"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Wine only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
 	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
@@ -16,8 +15,3 @@ config BR2_PACKAGE_WINE
 	  methods.
 
 	  http://www.winehq.org
-
-comment "wine needs a glibc toolchain"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_i386
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
