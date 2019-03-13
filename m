From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Mar 2019 17:50:39 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: fix comment on
 GL dependencies
Message-ID: <20190313164746.ECDF38B66D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fb4c14ecb1e8f001449830b65ec2a4606b87682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5declarative can be built/used without opengl support so fix the
dependency comment in qt5webengine.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 744d659567..bfc0a02c12 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_UDEV
 	# v8 (a chromium 3rd-party) compiles its internal host-tools with the
