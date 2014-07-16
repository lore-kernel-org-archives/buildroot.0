From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 16 Jul 2014 18:05:07 +0200
Subject: [Buildroot] [PATCH] qt5: Need pcre with UTF support
Message-ID: <1405526707-32091-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling PCRE16 is not enough for Qt5. PCREUTF is also necessary, else
Qt5 may complain with this kind of (non fatal) message:
  QRegularExpressionPrivate::doMatch(): called on an invalid QRegularExpression object

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/qt5/qt5base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 632711c..9f3d27c 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_16
+	select BR2_PACKAGE_PCRE_UTF
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.0.1
