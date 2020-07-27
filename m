From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 10:00:46 +0200
Subject: [Buildroot] [git commit] package/vlc: fix missing headers when
 compiling with Qt 5.15
Message-ID: <20200727075607.7F89588E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc657c8041d60957b4a42d55f8265263a520f04c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/832/832226c43549befda7e8c86a52354e7d6adc0a98/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...issing-header-when-compiling-with-Qt-5.15.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch b/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch
new file mode 100644
index 0000000000..1693511937
--- /dev/null
+++ b/package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch
@@ -0,0 +1,56 @@
+From a44d2f3aa6075fb6e63da75f84a257294d21d161 Mon Sep 17 00:00:00 2001
+From: Pierre Lamot <pierre@videolabs.io>
+Date: Wed, 27 May 2020 11:05:53 +0200
+Subject: [PATCH] qt: fix missing header when compiling with Qt 5.15
+
+Upstream bug report: https://trac.videolan.org/vlc/ticket/24882
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[backported upstream commit for modules/gui/qt/dialogs/plugins.cpp
+ http://git.videolan.org/?p=vlc.git;a=patch;h=0e88143ed2fe8eedfa4d3afdafcd0df901644c1d
+ the other two patches were proposed on the upstream bugtracker]
+---
+ modules/gui/qt/components/playlist/views.cpp | 1 +
+ modules/gui/qt/dialogs/plugins.cpp           | 1 +
+ modules/gui/qt/util/timetooltip.hpp          | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/modules/gui/qt/components/playlist/views.cpp b/modules/gui/qt/components/playlist/views.cpp
+index ecc6b9918d..d3fd76da1a 100644
+--- a/modules/gui/qt/components/playlist/views.cpp
++++ b/modules/gui/qt/components/playlist/views.cpp
+@@ -35,6 +35,7 @@
+ #include <QMetaType>
+ #include <QHeaderView>
+ #include <QSvgRenderer>
++#include <QPainterPath>
+ 
+ #include <assert.h>
+ 
+diff --git a/modules/gui/qt/dialogs/plugins.cpp b/modules/gui/qt/dialogs/plugins.cpp
+index 93c92b9fa6..e05ec0594a 100644
+--- a/modules/gui/qt/dialogs/plugins.cpp
++++ b/modules/gui/qt/dialogs/plugins.cpp
+@@ -66,6 +66,7 @@
+ #include <QSplitter>
+ #include <QToolButton>
+ #include <QStackedWidget>
++#include <QPainterPath>
+ 
+ //match the image source (width/height)
+ #define SCORE_ICON_WIDTH_SCALE 4
+diff --git a/modules/gui/qt/util/timetooltip.hpp b/modules/gui/qt/util/timetooltip.hpp
+index b6d7c646c9..f213eac459 100644
+--- a/modules/gui/qt/util/timetooltip.hpp
++++ b/modules/gui/qt/util/timetooltip.hpp
+@@ -25,6 +25,7 @@
+ #include "qt.hpp"
+ 
+ #include <QWidget>
++#include <QPainterPath>
+ 
+ class TimeTooltip : public QWidget
+ {
+-- 
+2.27.0
+
