Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62379C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C70840139;
	Thu,  6 Jan 2022 09:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vx-IscrQG7hJ; Thu,  6 Jan 2022 09:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF4C40339;
	Thu,  6 Jan 2022 09:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E937E1BF868
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6CA64027B
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t80XNu0iyPH for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:47:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC2804026F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:47:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C6478345E; Thu,  6 Jan 2022 09:40:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 10:45:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 007b5b483f2505c7af1f8b466b0f1b96e41d21fb
X-Git-Newrev: b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd
X-Patchwork-Hint: ignore
Message-Id: <20220106094059.6C6478345E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit-examples: remove
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7839431521108529841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7839431521108529841==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package seems to have issues building with the latest
qt5webkit release, as it has not received updates upstream
since 2017 remove it as it is unlikely to be fixed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  7 +++
 .../qt5webkit-examples/0001-Build-examples.patch   | 52 ---------------
 .../0002-Fix-QWebView-path.patch                   | 73 ----------------------
 .../0003-Fix-QPainterPath-include.patch            | 36 -----------
 package/qt5/qt5webkit-examples/Config.in           | 10 ---
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  8 ---
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 26 --------
 7 files changed, 7 insertions(+), 205 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e5349e58ac..004506e4bb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+	bool "qt5webkit-examples removed"
+	select BR2_LEGACY
+	help
+	  The qt5webkit-examples package is unmaintained and has been
+	  removed.
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
 	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
 	select BR2_LEGACY
diff --git a/package/qt5/qt5webkit-examples/0001-Build-examples.patch b/package/qt5/qt5webkit-examples/0001-Build-examples.patch
deleted file mode 100644
index cd925e21c5..0000000000
--- a/package/qt5/qt5webkit-examples/0001-Build-examples.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 78f558df35860484711a600d155ae7a13ebf44b2 Mon Sep 17 00:00:00 2001
-From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
-Date: Tue, 28 Nov 2017 23:14:42 -0500
-Subject: [PATCH] Build examples
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-This patch improves the qt5webkit examples build for 2 aspects:
-
-	- Allows to build even if qt5base examples are not enabled
-	- Builds xmlpatterns example only if the qt5xmlpattern package
-	has been built
-
-Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
-Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
-[gportay: build imageanalyzer example if concurrent module is built]
----
- examples/webkitwidgets/webkitwidgets.pro | 7 ++++---
- qtwebkit-examples.pro                    | 1 +
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/examples/webkitwidgets/webkitwidgets.pro b/examples/webkitwidgets/webkitwidgets.pro
-index ab20df4..67f6785 100644
---- a/examples/webkitwidgets/webkitwidgets.pro
-+++ b/examples/webkitwidgets/webkitwidgets.pro
-@@ -4,9 +4,10 @@ SUBDIRS +=  domtraversal \
-             previewer \
-             fancybrowser \
-             simpleselector \
--            imageanalyzer \
-             framecapture \
-             browser \
-             embedded \
--            scroller \
--            xmlpatterns
-+            scroller
-+
-+qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
-+qtHaveModule(concurrent): SUBDIRS += imageanalyzer
-diff --git a/qtwebkit-examples.pro b/qtwebkit-examples.pro
-index 3fcecf1..2ade7ff 100644
---- a/qtwebkit-examples.pro
-+++ b/qtwebkit-examples.pro
-@@ -3,3 +3,4 @@ requires(qtHaveModule(webkit))
- load(qt_parts)
- 
- SUBDIRS += doc
-+SUBDIRS += examples
--- 
-2.15.0
-
diff --git a/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch b/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch
deleted file mode 100644
index 30aab30167..0000000000
--- a/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9fa73707216bd55dff380031a33aca701a7d9c8b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 May 2019 23:29:05 +0200
-Subject: [PATCH] Fix QWebView path
-
-QWebView is installed under QtWebKitWidgets
-
-Fixes:
- - http://autobuild.buildroot.org/results/68dd6f1ffed49f8e2570f7364e5e635573807d3e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- examples/webkitwidgets/formextractor/formextractor.ui           | 2 +-
- examples/webkitwidgets/previewer/previewer.ui                   | 2 +-
- examples/webkitwidgets/simpleselector/window.ui                 | 2 +-
- .../xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui             | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/examples/webkitwidgets/formextractor/formextractor.ui b/examples/webkitwidgets/formextractor/formextractor.ui
-index 5c4afec..a38bdd5 100644
---- a/examples/webkitwidgets/formextractor/formextractor.ui
-+++ b/examples/webkitwidgets/formextractor/formextractor.ui
-@@ -151,7 +151,7 @@
-   <customwidget>
-    <class>QWebView</class>
-    <extends>QWidget</extends>
--   <header>QtWebKit/QWebView</header>
-+   <header>QtWebKitWidgets/QWebView</header>
-   </customwidget>
-  </customwidgets>
-  <resources/>
-diff --git a/examples/webkitwidgets/previewer/previewer.ui b/examples/webkitwidgets/previewer/previewer.ui
-index d4c9992..69adb2e 100644
---- a/examples/webkitwidgets/previewer/previewer.ui
-+++ b/examples/webkitwidgets/previewer/previewer.ui
-@@ -74,7 +74,7 @@
-   <customwidget>
-    <class>QWebView</class>
-    <extends>QWidget</extends>
--   <header>QtWebKit/QWebView</header>
-+   <header>QtWebKitWidgets/QWebView</header>
-   </customwidget>
-  </customwidgets>
-  <resources/>
-diff --git a/examples/webkitwidgets/simpleselector/window.ui b/examples/webkitwidgets/simpleselector/window.ui
-index aa824df..7906186 100644
---- a/examples/webkitwidgets/simpleselector/window.ui
-+++ b/examples/webkitwidgets/simpleselector/window.ui
-@@ -64,7 +64,7 @@
-   <customwidget>
-    <class>QWebView</class>
-    <extends>QWidget</extends>
--   <header>QtWebKit/QWebView</header>
-+   <header>QtWebKitWidgets/QWebView</header>
-   </customwidget>
-  </customwidgets>
-  <resources/>
-diff --git a/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui b/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
-index ad43284..000cae7 100644
---- a/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
-+++ b/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
-@@ -188,7 +188,7 @@ p, li { white-space: pre-wrap; }
-   <customwidget>
-    <class>QWebView</class>
-    <extends>QWidget</extends>
--   <header>QtWebKit/QWebView</header>
-+   <header>QtWebKitWidgets/QWebView</header>
-   </customwidget>
-  </customwidgets>
-  <resources/>
--- 
-2.20.1
-
diff --git a/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch b/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch
deleted file mode 100644
index 2d5e8fae9a..0000000000
--- a/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 452123a4491b26c5b078934477bd5864f1d004e4 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 28 May 2020 20:58:26 +0200
-Subject: [PATCH] Fix QPainterPath include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add missing QPainterPath (needed for Qt-5.15.0 compile).
-
-Fixes:
-
-  searchlineedit.cpp:121:18: error: aggregate ‘QPainterPath myPath’ has incomplete type and cannot be defined
-       QPainterPath myPath;
-                    ^~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/webkitwidgets/browser/searchlineedit.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/webkitwidgets/browser/searchlineedit.cpp b/examples/webkitwidgets/browser/searchlineedit.cpp
-index fbd73cb..7462c82 100644
---- a/examples/webkitwidgets/browser/searchlineedit.cpp
-+++ b/examples/webkitwidgets/browser/searchlineedit.cpp
-@@ -34,6 +34,7 @@
- #include "searchlineedit.h"
- 
- #include <QtGui/QPainter>
-+#include <QtGui/QPainterPath>
- #include <QtGui/QMouseEvent>
- #include <QtWidgets/QMenu>
- #include <QtWidgets/QStyle>
--- 
-2.26.2
-
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
deleted file mode 100644
index 47bbcbaa68..0000000000
--- a/package/qt5/qt5webkit-examples/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
-	bool "qt5webkit-examples"
-	depends on BR2_PACKAGE_QT5WEBKIT
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package contains examples for the qt5webkit module.
-
-	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
deleted file mode 100644
index ea64f6f14e..0000000000
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
-sha256  e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0  qtwebkit-examples-opensource-src-5.9.1.tar.xz
-
-# Hashes for license files:
-sha256  a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c  LICENSE.LGPLv21
-sha256  04505ee290cbe7b29b3766e00ff81987e84658f620cb43bd6e7bb52ee4234e1b  LICENSE.LGPLv3
-sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-sha256  d3d9052b838761dbe00067168ed9ebc437734d53ebf71dea1c8e9f7532a5333b  LICENSE.GPLv3
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
deleted file mode 100644
index 84bc291739..0000000000
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# qt5webkit-examples
-#
-################################################################################
-
-QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
-QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
-QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
-
-QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.GPLv3
-
-QT5WEBKIT_EXAMPLES_LICENSE = LGPL-2.1 with exception or LGPL-3 or GPL-2 or GPL-3
-# Source files contain references to LGPL_EXCEPTION.txt but it is not included
-# in the archive.
-
-ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
-QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
-endif
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5declarative
-endif
-
-$(eval $(qmake-package))

--===============7839431521108529841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7839431521108529841==--
