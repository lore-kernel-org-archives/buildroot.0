From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 7 Feb 2017 12:25:28 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "tslib: needs kernel headers 3.12"
In-Reply-To: <1486466728-24435-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <20170207101458.c5uhhasch73sihfx@tarshish>
 <1486466728-24435-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <1486466728-24435-2-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 7c60211ce38273580f1f8bf5886771406f9899ca.

tslib-1.4 removes this dependency.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/directfb/Config.in                       | 5 ++---
 package/qt/Config.mouse.in                       | 5 ++---
 package/qt5/qt5base/Config.in                    | 5 ++---
 package/tslib/Config.in                          | 5 ++---
 package/x11r7/xdriver_xf86-input-tslib/Config.in | 5 ++---
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 35c0309..b552164 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -113,12 +113,11 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	default y
 	select BR2_PACKAGE_TSLIB
 
-comment "touchscreen support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "touchscreen support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index f15f8d5..11da956 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -13,10 +13,9 @@ config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
 	select BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 
-comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e273caa..f22e034 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -278,12 +278,11 @@ config BR2_PACKAGE_QT5BASE_ICU
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
-comment "tslib support needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 endif
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 3665301..bc5d790 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  Tslib is a filtering layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
 
-comment "tslib needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "tslib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 79b7396..9c6e296 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
 	depends on !BR2_STATIC_LIBS # tslib
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # tslib
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -11,5 +10,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 
 	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
 
-comment "xf86-input-tslib needs a toolchain w/ dynamic library, headers >= 3.12"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "xf86-input-tslib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.1.4
