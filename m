From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:32:22 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: re-enable when
 toolchain has gcc bug 85862
Message-ID: <20190803133053.919C6886FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f16a211cd13fcc65638db1321cf34f7819c404e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Qt5 Latest package qt5webengine libnss that is affected by gcc bug
85862. However, that bug has now been worked around in libnss, so we
can remove the 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862', as
libnss is now available even if the toolchain is affected by gcc bug
85862.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 744d659567..969582712e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -20,18 +20,12 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
 
-comment "qt5webengine needs a toolchain not affected by GCC bug 85862"
-	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_QT5_VERSION_5_6
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
-
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
