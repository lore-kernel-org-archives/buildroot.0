From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 13 Mar 2019 09:50:45 +0100
Subject: [Buildroot] [PATCH] qt5webengine: fix comment on GL dependencies
Message-ID: <20190313085045.6515-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5declarative is configurable without opengl APIs so fix the
dependency comment in qt5webengine.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---

background:

This is part of my quest to lift the opengl-dependency entirely, see
https://bugreports.qt.io/browse/QTBUG-54327 or
https://wiki.qt.io/QtWebEngine/Rendering .
In case you have already tried that, I'd be happy about hints.

thanks

                             martin


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
-- 
2.20.1

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190313/39bd2ba2/attachment.bin>
