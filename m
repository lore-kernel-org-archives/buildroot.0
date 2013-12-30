From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 30 Dec 2013 11:34:17 +0200
Subject: [Buildroot] [PATCH 3/3] qt5webkit: depend on
	BR2_PACKAGE_QT5_JSCORE_AVAILABLE
In-Reply-To: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
References: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1388396057-19042-3-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5webkit/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 4a578ff..3a58566 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -8,8 +8,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
-	# This package is not supported on MIPS 64-bit architecture
-	depends on !BR2_mips64 && !BR2_mips64el
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
1.8.5.1
