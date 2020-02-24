From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:25 +0100
Subject: [Buildroot] [PATCH 08/36] package/qt5enginio: drop qt 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the now unused BR2_PACKAGE_QT5BASE_OPENSSL symbol.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in    |  4 ----
 package/qt5/qt5enginio/Config.in | 12 +-----------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 1862a7d9b6..60a611e292 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -283,10 +283,6 @@ comment "icu support needs a toolchain w/ gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
-config BR2_PACKAGE_QT5BASE_OPENSSL
-	bool
-	default y if BR2_PACKAGE_OPENSSL
-
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	select BR2_PACKAGE_TSLIB
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index f84d234771..d445d91dea 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
-	depends on BR2_PACKAGE_QT5BASE_OPENSSL
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
@@ -14,13 +14,3 @@ config BR2_PACKAGE_QT5ENGINIO
 	  5.6 and not recommended for new design.
 
 	  http://doc.qt.io/archives/qt-5.5/enginio-index.html
-
-# When Qt 5.6 is removed, replace the depends on
-# BR2_PACKAGE_QT5BASE_OPENSSL above by a select BR2_PACKAGE_OPENSSL.
-comment "qt5enginio needs libressl"
-	depends on BR2_PACKAGE_QT5_VERSION_5_6
-	depends on !BR2_PACKAGE_QT5BASE_OPENSSL
-
-comment "qt5enginio needs openssl"
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST
-	depends on !BR2_PACKAGE_QT5BASE_OPENSSL
-- 
2.20.1
