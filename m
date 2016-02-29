From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:46:30 +0100
Subject: [Buildroot] [git commit] package/kodi: reorder select/depends
Message-ID: <20160302202800.624B780203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c913784c986df8b191e3ea862a7b4595775e4cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in example in the manual suggests to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 13be622..abd1dc1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -33,6 +33,15 @@ comment "kodi requires an OpenGL ES and EGL backend"
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS # python
+	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_THREAD
@@ -90,15 +99,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
-	depends on BR2_USE_MMU # python
-	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS # python
-	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	help
 	  Kodi is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
@@ -132,8 +132,8 @@ config BR2_PACKAGE_KODI_DBUS
 
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
-	select BR2_PACKAGE_LIBBLURAY
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBBLURAY
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
@@ -228,8 +228,8 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	select BR2_PACKAGE_LIBVA
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
