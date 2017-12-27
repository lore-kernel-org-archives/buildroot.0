From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 27 Dec 2017 13:41:12 +0100
Subject: [Buildroot] [PATCH v1] package/qt5scxml: Needs QT5DECLARATIVE
 package
Message-ID: <1514378472-13479-1-git-send-email-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
qt5scxml package needs qml-private module which is delivered by qt5declaritive

Fixed: http://autobuild.buildroot.net/?reason=qt5scxml-5.9.3

 package/qt5/qt5scxml/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 4ae6a5b..a7b49a4 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5DECLARATIVE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.7.4
