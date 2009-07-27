From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:24:12 +0200
Subject: [Buildroot] [git commit] qt: put the Qt options into a submenu
Message-ID: <20090727132435.6F54D776CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2845fa66ce8efcf4a48a31e93832325ac1628cf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Put the Qt options into a submenu to make the configuration interface
easier to use. The comment on the dependency on C++ has to be put
before the menuconfig definition, otherwise kconfig gets confused and
doesn't put the suboptions into a submenu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index d68c923..59c691f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,4 +1,7 @@
-config BR2_PACKAGE_QT
+comment "qt requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+menuconfig BR2_PACKAGE_QT
 	bool "Qt"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
@@ -6,9 +9,6 @@ config BR2_PACKAGE_QT
 
 	  http://www.qtsoftware.com/products/platform/qt-for-embedded-linux
 
-comment "qt requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 if BR2_PACKAGE_QT
 
 config BR2_PACKAGE_QT_DEBUG
-- 
1.6.3.3
