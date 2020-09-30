From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 22:23:20 +0200
Subject: [Buildroot] [git commit] package/qt5base: XCB support needs
 xcb-util-renderutil
Message-ID: <20200930201326.5561A8E515@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4f7da760a63d629e8c78f6466e0550a045a0780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qt5base feature 'xcb_syslibs' is a compile check
using a xcb_render_util call (see qt5base-5.15.1/src/gui/configure.json).

Fixes:
  - http://autobuild.buildroot.net/results/3c05e597c073b823f8b091e17b676ed3ecf6b5b3

  ERROR: Feature 'xcb' was enabled, but the pre-condition 'features.thread && libs.xcb && tests.xcb_syslibs && features.xkbcommon-x11' failed.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 28b03f5438..ce7230c728 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -192,6 +192,7 @@ config BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
 	select BR2_PACKAGE_XCB_UTIL_WM
 	select BR2_PACKAGE_LIBXKBCOMMON
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1232a03778..e0189599a7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -177,6 +177,7 @@ QT5BASE_DEPENDENCIES   += \
 	xcb-util-wm \
 	xcb-util-image \
 	xcb-util-keysyms \
+	xcb-util-renderutil \
 	xlib_libX11 \
 	libxkbcommon
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
