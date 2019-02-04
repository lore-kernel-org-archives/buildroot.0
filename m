From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 11:16:40 +0100
Subject: [Buildroot] [git commit] package/kf5/kf5-kcoreaddons: new package
Message-ID: <20190204102414.C19E7837AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf48bf86295bc4628bcd14fd4ca415d6971c8ab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

KCoreAddons provides classes built on top of QtCore to perform various
tasks such as manipulating mime types, autosaving files, creating
backup files, generating random sequences, performing text
manipulations such as macro replacement, accessing user information
and many more.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
[yann.morin.1998 at free.fr + titouan.christophe at railnova.eu:
  - add missing qt5tools select
  - fix hash for new version
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Thomas:
 - fix typo in LICENSE_FILE -> LICENSE_FILES
 - add hash for license file
 - change license to LGPL-2.1 instead of LGPL-2.1+, since at least one
   file says "2.1" without the "or later" option, and so saying just
   LGPL-2.1 is the safe choice
]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/Config.in                            |  1 +
 package/kf5/kf5-kcoreaddons/Config.in            | 14 ++++++++++++++
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash |  3 +++
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk   | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 075b246269..2e50bce49e 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -8,6 +8,7 @@ menuconfig BR2_PACKAGE_KF5
 
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
+source "package/kf5/kf5-kcoreaddons/Config.in"
 source "package/kf5/kf5-modemmanager-qt/Config.in"
 source "package/kf5/kf5-networkmanager-qt/Config.in"
 endif
diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
new file mode 100644
index 0000000000..88fda03ee0
--- /dev/null
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_KF5_KCOREADDONS
+	bool "kf5-kcoreaddons"
+	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	select BR2_PACKAGE_QT5TOOLS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in
+	  various ways, not only restricted in helping integration
+	  in KDE.
+
+	  This package contains KCoreAddons, a set of classes built
+	  on top of QtCore to perform various tasks.
+
+	  https://api.kde.org/frameworks/kcoreaddons/html/index.html
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
new file mode 100644
index 0000000000..0cd8dcfc15
--- /dev/null
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 40ff04757e4ac19bc8448940fe18886c894a2069865966cc865fc55ff67b0b46 kcoreaddons-5.47.0.tar.xz
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LIB
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
new file mode 100644
index 0000000000..6cf7a3d107
--- /dev/null
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5-kcoreaddons
+#
+################################################################################
+
+KF5_KCOREADDONS_VERSION = $(KF5_VERSION)
+KF5_KCOREADDONS_SITE = $(KF5_SITE)
+KF5_KCOREADDONS_SOURCE = kcoreaddons-$(KF5_KCOREADDONS_VERSION).tar.xz
+KF5_KCOREADDONS_LICENSE = LGPL-2.1
+KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
+
+KF5_KCOREADDONS_DEPENDENCIES = kf5-extra-cmake-modules qt5tools
+KF5_KCOREADDONS_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
