From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 23:29:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5enginio: needs ssl
Message-ID: <20190309222953.7785-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove select on BR2_PACKAGE_QT5BASE and BR2_PACKAGE_OPENSSL to avoid a
circular dependency

Fixes:
 - http://autobuild.buildroot.org/results/60678cab68ec9aa17184b8417b64b3b79adf428a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5enginio/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index 102058e7c5..cce0f2a1cb 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT5BASE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
-- 
2.20.1
