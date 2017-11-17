From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Nov 2017 10:31:55 +0100
Subject: [Buildroot] [git commit] qt5webkit: correct download URL and hash
 for 5.6 variant
Message-ID: <20171117092511.8D22981368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4a119ccc42f5b93a2e33f99438a86cc5ee1fb00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 1a5e726..aa3a71c 100644
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
index 6e982e6..592eae9 100644
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
