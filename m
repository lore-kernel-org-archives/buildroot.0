From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  2 Jul 2018 08:28:25 -0400
Subject: [Buildroot] [PATCH] qt5base: add comment for qt5webkit examples
Message-ID: <20180702122825.14954-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unlike every other Qt5 modules, the examples of QtWebKit are located in
the dedicated package qt5webkit-examples. This is confusing.

This commit adds a comment to warn the user that QtWebKit examples are
available under a dedicated package. The comment shows up in the case
where the Qt examples is set and qt5webkit-examples is left unset.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5base/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b9aba2d389..35f990b773 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -42,6 +42,10 @@ config BR2_PACKAGE_QT5BASE_CONFIG_FILE
 	  This option allows to set the path of such a configuration
 	  file, which Buildroot will give to Qt at compile time.
 
+comment "WebKit examples are available in package qt5webkit-example"
+	depends on BR2_PACKAGE_QT5BASE_EXAMPLES
+	depends on !BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+
 config BR2_PACKAGE_QT5BASE_EXAMPLES
 	bool "Compile and install examples (with code)"
 	select BR2_PACKAGE_QT5BASE_NETWORK
-- 
2.11.0
