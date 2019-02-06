From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:55 +0100
Subject: [Buildroot] [PATCH 13/16] package/gjson: remove qt4 support
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-13-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt4 support is about to be dropped, so remove the support from qjson as
well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qjson/Config.in | 4 ++--
 package/qjson/qjson.mk  | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index 5c423bf317..243a6c1229 100644
--- a/package/qjson/Config.in
+++ b/package/qjson/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QJSON
 	bool "qjson"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
 	help
 	  QJson is a Qt-based library that maps JSON data to
 	  QVariant objects and vice versa.
@@ -10,4 +10,4 @@ config BR2_PACKAGE_QJSON
 
 comment "qjson needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
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
 
-- 
2.11.0
