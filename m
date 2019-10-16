From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:20:36 +0200
Subject: [Buildroot] [git commit] package/exempi: needs wchar
Message-ID: <20191016201434.E05BC8137F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560eebda5eda3c611423e354b57892cbfc63419e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/283fddd3e5c1bd3e0ea843bd582491e68a47f1e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exempi/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/exempi/Config.in b/package/exempi/Config.in
index c9af219a20..eba12a2a3c 100644
--- a/package/exempi/Config.in
+++ b/package/exempi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EXEMPI
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_ZLIB
@@ -12,5 +13,6 @@ config BR2_PACKAGE_EXEMPI
 
 	  http://libopenraw.freedesktop.org/wiki/Exempi
 
-comment "exempi needs a toolchain w/ C++, dynamic library, threads"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "exempi needs a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
