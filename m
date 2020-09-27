From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 27 Sep 2020 23:20:00 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: XCB support needs
 xcb-util-renderutil
Message-ID: <20200927212000.16959-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt5base feature 'xcb_syslibs' is a compile check
using a xcb_render_util call (see qt5base-5.15.1/src/gui/configure.json).

Fixes:
  - http://autobuild.buildroot.net/results/3c05e597c073b823f8b091e17b676ed3ecf6b5b3

  ERROR: Feature 'xcb' was enabled, but the pre-condition 'features.thread && libs.xcb && tests.xcb_syslibs && features.xkbcommon-x11' failed.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
index 359a380075..321b8ae48b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -174,6 +174,7 @@ QT5BASE_DEPENDENCIES   += \
 	xcb-util-wm \
 	xcb-util-image \
 	xcb-util-keysyms \
+	xcb-util-renderutil \
 	xlib_libX11 \
 	libxkbcommon
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
-- 
2.28.0
