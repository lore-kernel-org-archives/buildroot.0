From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:04:48 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: fix qt5declarative
 dependency
Message-ID: <20171228090526.2372D83702@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d2dd70bea7b20338f4011865ef405b98f51e51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes additional improvements after commit
187d24701ded6bec598e4aec272033f33f158de7 ("package/qt5/qt5scxml: needs
qt5declarative package") :

- add qt5declarative depends comment
- add missing qt5declarative dependency

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5scxml/Config.in   | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 469bdc1..d94b5ea 100644
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
index 4b1f979..2d197a2 100644
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
