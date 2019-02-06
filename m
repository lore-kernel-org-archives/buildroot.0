From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:43:47 +0100
Subject: [Buildroot] [git commit] package/qjson: remove qt4 support
Message-ID: <20190206145217.1553C8040D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c412f25a70b20ae755497d4c6fb18ae4633cc857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt4 support is about to be dropped, so remove the support from qjson as
well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: also remove redundant BR2_STATIC_LIBS dependency/comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qjson/Config.in | 7 +------
 package/qjson/qjson.mk  | 4 +---
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index 5c423bf317..adb06cddc0 100644
--- a/package/qjson/Config.in
+++ b/package/qjson/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_QJSON
 	bool "qjson"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
 	help
 	  QJson is a Qt-based library that maps JSON data to
 	  QVariant objects and vice versa.
 
 	  http://qjson.sourceforge.net
-
-comment "qjson needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 1777b9454c..718d6622a8 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -7,9 +7,7 @@
 QJSON_VERSION = 0.9.0
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_QT),qt) \
-	$(if $(BR2_PACKAGE_QT5),qt5base)
+QJSON_DEPENDENCIES = qt5base
 QJSON_LICENSE = LGPL-2.1
 QJSON_LICENSE_FILES = COPYING.lib
 
