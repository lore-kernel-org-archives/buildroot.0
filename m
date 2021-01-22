From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 09:39:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/vlc: security
 bump version to 3.0.12
Message-ID: <20210122083927.CD36283B22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17c1e129e6e65f956b85f83b511763a24a10befb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Removed patch which was applied upstream, removed md5 hash.

Security Bulletin: https://www.videolan.org/security/sb-vlc3012.html
Fixes CVE-2020-26664: https://nvd.nist.gov/vuln/detail/CVE-2020-26664

Added CPE_ID, cpe:2.3:a:videolan:vlc_media_player is a valid CPE
identifier for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Avlc_media_player&status=FINAL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de128d9ad62a96b8497992f439b5eeab4da9efc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...issing-header-when-compiling-with-Qt-5.15.patch | 56 ----------------------
 package/vlc/vlc.hash                               | 10 ++--
 package/vlc/vlc.mk                                 |  4 +-
 3 files changed, 7 insertions(+), 63 deletions(-)

diff --git a/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch b/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch
deleted file mode 100644
index 1693511937..0000000000
--- a/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a44d2f3aa6075fb6e63da75f84a257294d21d161 Mon Sep 17 00:00:00 2001
-From: Pierre Lamot <pierre@videolabs.io>
-Date: Wed, 27 May 2020 11:05:53 +0200
-Subject: [PATCH] qt: fix missing header when compiling with Qt 5.15
-
-Upstream bug report: https://trac.videolan.org/vlc/ticket/24882
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[backported upstream commit for modules/gui/qt/dialogs/plugins.cpp
- http://git.videolan.org/?p=vlc.git;a=patch;h=0e88143ed2fe8eedfa4d3afdafcd0df901644c1d
- the other two patches were proposed on the upstream bugtracker]
----
- modules/gui/qt/components/playlist/views.cpp | 1 +
- modules/gui/qt/dialogs/plugins.cpp           | 1 +
- modules/gui/qt/util/timetooltip.hpp          | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/modules/gui/qt/components/playlist/views.cpp b/modules/gui/qt/components/playlist/views.cpp
-index ecc6b9918d..d3fd76da1a 100644
---- a/modules/gui/qt/components/playlist/views.cpp
-+++ b/modules/gui/qt/components/playlist/views.cpp
-@@ -35,6 +35,7 @@
- #include <QMetaType>
- #include <QHeaderView>
- #include <QSvgRenderer>
-+#include <QPainterPath>
- 
- #include <assert.h>
- 
-diff --git a/modules/gui/qt/dialogs/plugins.cpp b/modules/gui/qt/dialogs/plugins.cpp
-index 93c92b9fa6..e05ec0594a 100644
---- a/modules/gui/qt/dialogs/plugins.cpp
-+++ b/modules/gui/qt/dialogs/plugins.cpp
-@@ -66,6 +66,7 @@
- #include <QSplitter>
- #include <QToolButton>
- #include <QStackedWidget>
-+#include <QPainterPath>
- 
- //match the image source (width/height)
- #define SCORE_ICON_WIDTH_SCALE 4
-diff --git a/modules/gui/qt/util/timetooltip.hpp b/modules/gui/qt/util/timetooltip.hpp
-index b6d7c646c9..f213eac459 100644
---- a/modules/gui/qt/util/timetooltip.hpp
-+++ b/modules/gui/qt/util/timetooltip.hpp
-@@ -25,6 +25,7 @@
- #include "qt.hpp"
- 
- #include <QWidget>
-+#include <QPainterPath>
- 
- class TimeTooltip : public QWidget
- {
--- 
-2.27.0
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 7775e449f4..f404cbf335 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha256
-sha256  3e94a1acf33445e9da15d528aa48657aa26b912eaa2656b403d43860a8834919  vlc-3.0.11.tar.xz
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha1
-sha1  66d377a2f24b6b865d5c56530e10d84b8262b46c  vlc-3.0.11.tar.xz
-# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.md5
-md5  7e68f9e2d307eb7cc16e7345cda9e978  vlc-3.0.11.tar.xz
+# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha256
+sha256  eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879  vlc-3.0.12.tar.xz
+# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha1
+sha1  39ef414a07202ec6569acda4c5d91e8576d453bf  vlc-3.0.12.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 23dcc5d46f..6ee80fd45a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.11
+VLC_VERSION = 3.0.12
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
+VLC_CPE_ID_VENDOR = videolan
+VLC_CPE_ID_NAME = vlc_media_player
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
