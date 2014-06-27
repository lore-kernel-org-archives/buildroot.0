From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 13:08:04 +0200
Subject: [Buildroot] [git commit] qt5: bump to 5.3.1
Message-ID: <20140627111029.827F39D0E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c169981c3fcab95c284c42e81bca16caf3950e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |    2 +-
 ...ck-for-QtGui-before-building-the-examples.patch |   46 --------------------
 2 files changed, 1 insertions(+), 47 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index c897496..44e5af0 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION_MAJOR = 5.3
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules/
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch b/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch
deleted file mode 100644
index b269740..0000000
--- a/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-qt5script: Check for QtGui before building the examples
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From e4453c92ee41943a3a1d67a725804a44e747f64e Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 16 Apr 2014 12:19:17 +0100
-Subject: [PATCH] qtscript: Check for QtGui before building the examples
-
-qsdbg and marshal examples need QtGui module. If QtGui is not installed
-they fail to compile.
-
-Change-Id: I1af6a8b39a0848c8208fe94a26ee57409dfd9b41
-Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@digia.com>
----
- examples/script/script.pro | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/examples/script/script.pro b/examples/script/script.pro
-index 3e1eae6..cc97233 100644
---- a/examples/script/script.pro
-+++ b/examples/script/script.pro
-@@ -1,7 +1,7 @@
- TEMPLATE = subdirs
--SUBDIRS = \
--    customclass \
--    qsdbg
-+SUBDIRS = customclass
-+
-+qtHaveModule(gui): SUBDIRS += qsdbg
- 
- qtHaveModule(widgets) {
-     SUBDIRS += \
-@@ -22,8 +22,7 @@ qtHaveModule(widgets) {
- }
- 
- !wince {
--    SUBDIRS += \
--        marshal
-+    qtHaveModule(gui): SUBDIRS += marshal
- }
- 
- maemo5: CONFIG += qt_example
--- 
-1.9.1
-
