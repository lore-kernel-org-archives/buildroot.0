From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 09:13:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/midori: needs gcc
 >= 7
Message-ID: <20200508080227.4B9DE90FE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbc2f26d06e3f45c2fe316c6fad0fc18a275e9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4 forgot to propagate
gcc >= 7 dependency to midori

Fixes:
 - http://autobuild.buildroot.org/results/736a99dcaa72fba3f06775d08c4395f506fce944

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de5a74193b270e4bff19a45a4b82a70fb70857fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/midori/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 64139ce49e..089f36ced8 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
