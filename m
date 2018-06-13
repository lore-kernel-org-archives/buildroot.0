From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:55:31 +0200
Subject: [Buildroot] [git commit] qt5webengine: fix
 BR2_TOOLCHAIN_HAS_GCC_BUG_85862 condition
Message-ID: <20180613205419.88BB9885A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faf50414611b674b1758900d228fa6156cb65d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit bd03966d4ebeb284ac3afb5f3b8cba13da2b9983 ("toolchain: GCC
bug 85862"), a dependency on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 was added
to the qt5webengine package, but it should have been a dependency on
!BR2_TOOLCHAIN_HAS_GCC_BUG_85862. This commit fixes that.

Signed-off-by: David Barbion <david.barbion@ext.leroymerlin.fr>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 38486c6dcf..744d659567 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
