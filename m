From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:48:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/kodi: reorder select/depends
In-Reply-To: <1454168886-30961-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454168886-30961-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454168886-30961-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in example in the manual suggests to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/kodi/Config.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ed90ed6..f1236f7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -32,6 +32,14 @@ comment "kodi requires an OpenGL ES and EGL backend"
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
+	depends on !BR2_STATIC_LIBS # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR
 	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_THREAD
@@ -88,14 +96,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
-	depends on BR2_INSTALL_LIBSTDCPP
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
-- 
2.7.0.rc3
