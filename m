From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2009 10:44:10 +0200
Subject: [Buildroot] [git commit] New build fix for Qtopia4
Message-ID: <20090703112133.EF2E1763A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1125b31af64bb3fbe40b7db2be0e70f4c2471bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The new patch fixes the build failure when
BR2_PACKAGE_QTOPIA4_QTZLIB=y.
---
 .../qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch   |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch

diff --git a/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch b/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch
new file mode 100644
index 0000000..b191cc7
--- /dev/null
+++ b/package/qtopia4/qtopia-4.5.2-fix-qt-zlib-build.patch
@@ -0,0 +1,20 @@
+When QT is compiled in qt-zlib mode, compilation of
+src/gui/painting/qprintengine_pdf.cpp fails because zlib.h is not
+found. The following patch adds the internal QT zlib directory to the
+include path to fix this issue.
+
+---
+ src/gui/painting/painting.pri |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.2.orig/src/gui/painting/painting.pri
++++ qt-embedded-linux-opensource-src-4.5.2/src/gui/painting/painting.pri
+@@ -367,3 +367,6 @@
+         SOURCES += painting/qwindowsurface_d3d.cpp
+ }
+ 
++contains(QT_CONFIG, zlib) {
++   INCLUDEPATH += ../3rdparty/zlib
++}
-- 
1.6.3.3
