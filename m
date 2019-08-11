From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:47:25 +0200
Subject: [Buildroot] [git commit] package/opencv: gtk support needs gcc >=
 4.8
Message-ID: <20190811210019.9D60481336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76e902ca8c63977c41b9a9a069674c3bea53125e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 gtk support needs gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 54094b29ca..c74dfd9572 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -241,6 +241,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
