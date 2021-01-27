From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 23:01:54 +0100
Subject: [Buildroot] [git commit] package/gerbera: needs gcc >= 8
Message-ID: <20210127214237.0DC2E802AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70db2351da182b1317c45ecd03947af555d5a703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

std::filesystem is required since version 1.5.0:
https://github.com/gerbera/gerbera/issues/849

Fixes:
 - http://autobuild.buildroot.org/results/759c875ee8ab0447cd735c22f89fa127cb8c427c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gerbera/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index a07bcc5c57..b734de95de 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17 optional
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
@@ -22,8 +22,8 @@ config BR2_PACKAGE_GERBERA
 
 	  https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, threads, wchar, gcc >= 7"
+comment "gerbera needs a toolchain w/ C++, threads, wchar, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
