From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Dec 2017 23:36:41 +0100
Subject: [Buildroot] [PATCH v1] package/qt5/qt5scxml: needs qt5declarative
 package (fixes)
Message-ID: <20171227223641.8885-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add qt5declarative depends comment
- add missing qt5declarative dependency

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5scxml/Config.in   | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 469bdc1d3a..d94b5ea1c6 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	help
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 4b1f97973d..2d197a2bca 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -7,7 +7,7 @@
 QT5SCXML_VERSION = $(QT5_VERSION)
 QT5SCXML_SITE = $(QT5_SITE)
 QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
-QT5SCXML_DEPENDENCIES = qt5base
+QT5SCXML_DEPENDENCIES = qt5base qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
 
 QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-- 
2.15.1
