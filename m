From: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Thu, 15 Feb 2018 21:48:13 +0100
Subject: [Buildroot] [PATCH 3/5] Add KF5 package networkmanager-qt
In-Reply-To: <20180215204815.14707-1-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
Message-ID: <20180215204815.14707-3-pinaraf@pinaraf.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

networkmanager-qt is a simple Qt wrapper on the NetworkManager API.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
---
 package/kf5/Config.in                                    |  1 +
 package/kf5/kf5-networkmanager-qt/Config.in              | 13 +++++++++++++
 .../kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash |  2 ++
 .../kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/kf5/kf5-networkmanager-qt/Config.in
 create mode 100644 package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
 create mode 100644 package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 89d8c7a140..2770ba81e7 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -7,4 +7,5 @@ menuconfig BR2_PACKAGE_KF5
 
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
+source "package/kf5/kf5-networkmanager-qt/Config.in"
 endif
diff --git a/package/kf5/kf5-networkmanager-qt/Config.in b/package/kf5/kf5-networkmanager-qt/Config.in
new file mode 100644
index 0000000000..aff4f39ae2
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KF5_NETWORKMANAGER_QT
+	bool "kf5-networkmanager-qt"
+	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	select BR2_PACKAGE_NETWORK_MANAGER
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in
+	  various ways, not only restricted in helping integration
+	  in KDE.
+	  
+	  This package contains the NetworkManager Qt5 bindings from the
+	  KF5 project.
+
+	  https://api.kde.org/frameworks/networkmanager-qt/html/index.html
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
new file mode 100644
index 0000000000..d3c0f96d46
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0cbbcaa2db1f9bd5445b9c7c5f1e79313df5060f7c31617d673d00f19600755e networkmanager-qt-5.43.0.tar.xz
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
new file mode 100644
index 0000000000..edaa7999f5
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5-networkmanager-qt
+#
+################################################################################
+
+KF5_NETWORKMANAGER_QT_VERSION = $(KF5_VERSION)
+KF5_NETWORKMANAGER_QT_SITE = $(KF5_SITE)
+KF5_NETWORKMANAGER_QT_SOURCE = networkmanager-qt-$(KF5_NETWORKMANAGER_QT_VERSION).tar.xz
+KF5_NETWORKMANAGER_QT_LICENSE = LGPL-2.1+
+KF5_NETWORKMANAGER_QT_LICENSE_FILE = COPYING.LIB
+
+KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager
+KF5_NETWORKMANAGER_QT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.16.1
