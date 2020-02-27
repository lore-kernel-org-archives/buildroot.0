From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:52:30 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5scxml: drop qt 5.6
 support
Message-ID: <20200227224530.0245E8E865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57e30291c502020000d01d279513bb4e54444579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5scxml/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index d94b5ea1c6..5510821d24 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
@@ -12,7 +11,3 @@ config BR2_PACKAGE_QT5SCXML
 	  machines from SCXML files.
 
 	  https://doc.qt.io/qt-5/qtscxml-index.html
-
-comment "qt5scxml needs at least qt-5.9"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_VERSION_LATEST
