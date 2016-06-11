From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:31:26 +0200
Subject: [Buildroot] [git commit] qt5base: fix build with ALSA >= 1.1.x
Message-ID: <20160611143224.009B18186E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97959eec223a3708ab67510ea98e2c9e52e7e98f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds an upstream qtbase commit that fixes the detection of
ALSA versions >= 1.1.x, as we have in Buildroot.

Signed-off-by: Jiri Novotny <jiri.novotny@logicelements.cz>
[Thomas: change to use the upstream commit directly, using <pkg>_PATCH.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.hash | 1 +
 package/qt5/qt5base/qt5base.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 934fb5d..3ebc56e 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,3 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtbase-opensource-src-5.6.0.tar.xz.mirrorlist
 sha256 6efa8a5c559e92b2e526d48034e858023d5fd3c39115ac1bfd3bb65834dbd67a qtbase-opensource-src-5.6.0.tar.xz
+sha256 e03740e20b8dbf52d163d8a4a37125e7c55b59a9a5e7cf7e89a08e07286b6135	b8f98d956501dfa4ce03a137f15d404930a56066.patch
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9ff7af1..c4b9a54 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -7,6 +7,7 @@
 QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
+QT5BASE_PATCH = https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.patch
 
 QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
 QT5BASE_INSTALL_STAGING = YES
