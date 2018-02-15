From: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Thu, 15 Feb 2018 21:48:14 +0100
Subject: [Buildroot] [PATCH 4/5] Add KF5 package modemmanager-qt
In-Reply-To: <20180215204815.14707-1-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
Message-ID: <20180215204815.14707-4-pinaraf@pinaraf.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

modemmanager-qt is a simple Qt wrapper on the ModemManager API.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
---
 package/kf5/Config.in                                    |  1 +
 package/kf5/kf5-modemmanager-qt/Config.in                | 13 +++++++++++++
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash |  2 ++
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/kf5/kf5-modemmanager-qt/Config.in
 create mode 100644 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
 create mode 100644 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 2770ba81e7..4a002fa28a 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -7,5 +7,6 @@ menuconfig BR2_PACKAGE_KF5
 
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
+source "package/kf5/kf5-modemmanager-qt/Config.in"
 source "package/kf5/kf5-networkmanager-qt/Config.in"
 endif
diff --git a/package/kf5/kf5-modemmanager-qt/Config.in b/package/kf5/kf5-modemmanager-qt/Config.in
new file mode 100644
index 0000000000..645ca5cf01
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KF5_MODEMMANAGER_QT
+	bool "kf5-modemmanager-qt"
+	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	select BR2_PACKAGE_MODEM_MANAGER
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in
+	  various ways, not only restricted in helping integration
+	  in KDE.
+	  
+	  This package contains the ModemManager Qt5 bindings from the
+	  KF5 project.
+
+	  https://api.kde.org/frameworks/modemmanager-qt/html/index.html
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
new file mode 100644
index 0000000000..f3cb6f4deb
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 dc502277001cdf65fe5118780e9c8cb3c568af54c387d7c2b0904a438053089a modemmanager-qt-5.43.0.tar.xz
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
new file mode 100644
index 0000000000..149a337ac7
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5-modemmanager-qt
+#
+################################################################################
+
+KF5_MODEMMANAGER_QT_VERSION = $(KF5_VERSION)
+KF5_MODEMMANAGER_QT_SITE = $(KF5_SITE)
+KF5_MODEMMANAGER_QT_SOURCE = modemmanager-qt-$(KF5_MODEMMANAGER_QT_VERSION).tar.xz
+KF5_MODEMMANAGER_QT_LICENSE = LGPL-2.1+
+KF5_MODEMMANAGER_QT_LICENSE_FILE = COPYING.LIB
+
+KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager
+KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.16.1
