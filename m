From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:04:14 +0200
Subject: [Buildroot] [git commit] package/kf5/kf5-extra-cmake-modules: new
 package
Message-ID: <20180630220216.7573483996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77f70f8b88a7b8a157bb6032afa884e1dc84f6ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kf5-extra-cmake-modules contains several additional CMake modules used
by the other KF5 packages. It does not install anything on the target
and contain only CMake files for the host.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
[Thomas:
 - update to version 5.47
 - add hash for license file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/Config.in                                   |  1 +
 package/kf5/kf5-extra-cmake-modules/Config.in           | 10 ++++++++++
 .../kf5-extra-cmake-modules.hash                        |  3 +++
 .../kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk  | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index cbc3d0b70d..1db0fbfe51 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -7,4 +7,5 @@ menuconfig BR2_PACKAGE_KF5
 	  allow to select which modules should be built.
 
 if BR2_PACKAGE_KF5
+source "package/kf5/kf5-extra-cmake-modules/Config.in"
 endif
diff --git a/package/kf5/kf5-extra-cmake-modules/Config.in b/package/kf5/kf5-extra-cmake-modules/Config.in
new file mode 100644
index 0000000000..7cb1036c75
--- /dev/null
+++ b/package/kf5/kf5-extra-cmake-modules/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	bool "kf5-extra-cmake-modules"
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in various
+	  ways, not only restricted in helping integration in KDE.
+
+	  This package corresponds to the extra CMake modules,
+	  required for most KF5 libraries.
+
+	  https://api.kde.org/frameworks/extra-cmake-modules/html/index.html
diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
new file mode 100644
index 0000000000..733e267fdb
--- /dev/null
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 976d8bd15a0b929376bfaef34602a0fb9614229851c46fac3c4b28938f682195 extra-cmake-modules-5.47.0.tar.xz
+sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
new file mode 100644
index 0000000000..7b96e1f1bb
--- /dev/null
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kf5-extra-cmake-modules
+#
+################################################################################
+
+KF5_EXTRA_CMAKE_MODULES_VERSION = $(KF5_VERSION)
+KF5_EXTRA_CMAKE_MODULES_SITE = $(KF5_SITE)
+KF5_EXTRA_CMAKE_MODULES_SOURCE = extra-cmake-modules-$(KF5_EXTRA_CMAKE_MODULES_VERSION).tar.xz
+KF5_EXTRA_CMAKE_MODULES_LICENSE = BSD-3-Clause
+KF5_EXTRA_CMAKE_MODULES_LICENSE_FILE = COPYING-CMAKE-SCRIPTS
+
+KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf
+KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
+KF5_EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
