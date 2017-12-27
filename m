From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Dec 2017 21:59:47 +0100
Subject: [Buildroot] [PATCH v1] qt5scxml: needs qt5declarative
Message-ID: <20171227205947.25104-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  make[2]: Entering directory `.../build/qt5scxml-5.9.3/src'
  cd scxml/ && ( test -e Makefile || .../host/bin/qmake -o Makefile .../build/qt5scxml-5.9.3/src/scxml/scxml.pro ) && /usr/bin/make -f Makefile
  Project ERROR: Unknown module(s) in QT: qml-private
  make[2]: *** [sub-scxml-make_first] Error 3

[1] http://autobuild.buildroot.net/results/2f0d6d0fcc93dc12d952913f31210ff4be93b7ef

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5scxml/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 4ae6a5b4a9..c7ca315fa1 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5XMLPATTERNS # qt5declarative
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.15.1
