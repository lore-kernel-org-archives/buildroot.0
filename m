From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jun 2015 00:07:55 +0200
Subject: [Buildroot] [git commit] kodi: propagate the dynamic library
	dependency of python
Message-ID: <20150607221446.8788780824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36e69dc2415f4bd2759c29bdd39a289b0a3776f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a4d1aab..ea4b449 100644
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
