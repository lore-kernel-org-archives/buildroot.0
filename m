From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 22:07:01 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: needs qt5declarative
 package
Message-ID: <20171227210731.11EFE83571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=187d24701ded6bec598e4aec272033f33f158de7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5scxml package needs qml-private module which is delivered by
qt5declarative.

Fixes:

  http://autobuild.buildroot.net/results/9e650f6147f7858be74782806f4b8d2aac4c689a/

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[Thomas: add missing dependency on BR2_PACKAGE_QT5_JSCORE_AVAILABLE,
adjust commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5scxml/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 4ae6a5b..469bdc1 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5DECLARATIVE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -12,4 +14,5 @@ config BR2_PACKAGE_QT5SCXML
 	  https://doc.qt.io/qt-5/qtscxml-index.html
 
 comment "qt5scxml needs at least qt-5.9"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
