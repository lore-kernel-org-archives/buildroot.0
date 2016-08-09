From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 12:10:48 +0200
Subject: [Buildroot] [git commit] qt: fix build with ALSA >= 1.1.x
Message-ID: <20160809101358.A4AFC8218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a880db09bf1966f7e86b054bba9cbdd62941e139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ALSA > 1.1.x are not determined correctly when configuring the library.
A patch, identical to the one used for Qt5, is added to the qt package
to solve this problem.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.hash | 1 +
 package/qt/qt.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/qt/qt.hash b/package/qt/qt.hash
index 301010c..de81368 100644
--- a/package/qt/qt.hash
+++ b/package/qt/qt.hash
@@ -1,3 +1,4 @@
 # md5 http://download.qt.io/official_releases/qt/4.8/4.8.7/md5sums-4.8.7, sha256 locally computed:
 md5    d990ee66bf7ab0c785589776f35ba6ad                                 qt-everywhere-opensource-src-4.8.7.tar.gz
 sha256 e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0 qt-everywhere-opensource-src-4.8.7.tar.gz
+sha256 e03740e20b8dbf52d163d8a4a37125e7c55b59a9a5e7cf7e89a08e07286b6135 b8f98d956501dfa4ce03a137f15d404930a56066.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 47d5b00..c2d2e9c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -15,6 +15,9 @@ QT_VERSION_MAJOR = 4.8
 QT_VERSION = $(QT_VERSION_MAJOR).7
 QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
+# Patch fixing ALSA detection. Taken from Qt5, but applies fine to
+# Qt4.
+QT_PATCH = https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.patch
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
