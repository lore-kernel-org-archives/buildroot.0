From: Baruch Siach <baruch@tkos.co.il>
Date: Sat,  6 Jun 2015 23:54:27 +0300
Subject: [Buildroot] [PATCH 2/2] kodi: propagate the dynamic library
	dependency of python
In-Reply-To: <2e5c9f50b0166df6fbd783a63da7d74a2ba2425d.1433624067.git.baruch@tkos.co.il>
References: <2e5c9f50b0166df6fbd783a63da7d74a2ba2425d.1433624067.git.baruch@tkos.co.il>
Message-ID: <ea7975a35140de42a281a3497178700a6464db5f.1433624067.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/kodi/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a4d1aab21405..ea4b44973ec6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -3,9 +3,10 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 
-comment "kodi needs a toolchain w/ C++, threads, wchar"
+comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -97,6 +98,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS # python
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	help
 	  Kodi is an award-winning free and open source (GPL) software
-- 
2.1.4
