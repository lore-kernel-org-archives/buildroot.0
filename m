From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 23:06:12 +0100
Subject: [Buildroot] [git commit] qjson: allow building with Qt5
Message-ID: <20141103220809.D210FB1943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8eaeaec8cf4d8bdfbea84d35fbd1e57dfc4ca45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 18714011b231fc326c96782134fbea778ab6a94d ("qjson: bump
version"), qjson can be built either against Qt4 or Qt5. This commit
therefore allows this package to be selected when Qt5 is enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qjson/Config.in |    2 +-
 package/qjson/qjson.mk  |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index 2dc2cc4..0f0cc09 100644
--- a/package/qjson/Config.in
+++ b/package/qjson/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QJSON
 	bool "qjson"
-	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	help
 	  QJson is a Qt-based library that maps JSON data to
 	  QVariant objects and vice versa.
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 17f2d00..6a16617 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -7,7 +7,9 @@
 QJSON_VERSION = ba273682a9d33a7b3090e74f4742b5f3bf6c9b02
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES = qt
+QJSON_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_QT),qt) \
+	$(if $(BR2_PACKAGE_QT5),qt5base)
 QJSON_LICENSE = LGPLv2.1
 QJSON_LICENSE_FILES = COPYING.lib
 
