From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Nov 2017 15:23:04 +0100
Subject: [Buildroot] [PATCH 1/2] qt5webkit: correct download URL and hash
 for 5.6 variant
Message-ID: <20171116142305.29500-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 06a4975d4bd03 (qt5: bump LTS version to 5.6.3) added an empty hash
for the 5.6.3 variant of qt5webkit, causing failures.

It also forgot to adjust the download URL as the qt5webkit tarballs are no
longer available under official_releases/ like the other submodules, but only
under community_releases/.

Fix both issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.hash | 4 ++--
 package/qt5/qt5webkit/qt5webkit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 1a5e72664f..aa3a71c8d0 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.3/latest_src/submodules/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256  qtwebkit-opensource-src-5.6.3.tar.xz
+# Hash from: http://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256  098c6bb25798fbf1b619b540621287787064efc9b586d76ac0ce7e39b87a3896  qtwebkit-opensource-src-5.6.3.tar.xz
 
 # hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6e982e6bc7..592eae908d 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,7 +10,7 @@ QT5WEBKIT_VERSION = 5.9.1
 QT5WEBKIT_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 else
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = $(QT5_SITE)
+QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)/submodules
 endif
 
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-- 
2.11.0
