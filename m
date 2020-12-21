From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:36:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5scxml: drop qt
 5.6 support
Message-ID: <20201221124322.5C2D0815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=698211f5be89c3c4478e726a03e16d2a64349ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57e30291c502020000d01d279513bb4e54444579)
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
