From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 8 Jun 2017 15:32:14 +0200
Subject: [Buildroot] [PATCH] package/qt5base: enable static build for
	BR2_PACKAGE_QT5BASE_TSLIB
Message-ID: <20170608133214.13454-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
static builds. But since

   commit 05fadfea1 ("package/tslib: enable statically linked building")

it does and we can remove this dependecy.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/qt5/qt5base/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 3e6e89505..01ef43e14 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -271,12 +271,8 @@ comment "icu support needs a toolchain w/ gcc >= 4.8"
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
-	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_TSLIB
 	help
 	  This options enables the Tslib plugin
 
-comment "tslib support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
-- 
2.11.0
