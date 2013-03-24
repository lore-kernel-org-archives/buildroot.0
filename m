From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:42:39 +0100
Subject: [Buildroot] [git commit] qt5: factor Qt5 version
Message-ID: <20130324134632.7098E9B26F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22c4c4b9491fc509af42d300bfa8cb6f727e1f66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the Qt5 version will be the same for all Qt5 modules, factor it
in qt5/qt5.mk as QT5_VERSION.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5.mk             |    1 +
 package/qt5/qt5base/qt5base.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index f220508..83cc0e1 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,3 +1,4 @@
+QT5_VERSION = 5.0.1
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 83ce999..d22ab66 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QT5BASE_VERSION = 5.0.1
+QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
