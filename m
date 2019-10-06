From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 14:13:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5: bump latest version to 5.12.5
Message-ID: <20191006121331.11015-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

- qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
https://codereview.qt-project.org/gitweb?p=qt/qtbase.git;a=commitdiff;h=8c0787cfa1a906ebe25907515d86050303b127e7

- qt5/qt5multimedia/5.12.5/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
https://codereview.qt-project.org/gitweb?p=qt/qtbase.git;a=commitdiff;h=8c0787cfa1a906ebe25907515d86050303b127e7

- qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5.mk                            |  2 +-
 package/qt5/qt53d/qt53d.hash                  |  4 +-
 ...x-dependency_libs-entry-of-.la-files.patch | 75 -------------------
 ...tbase-Fix-build-error-when-using-EGL.patch |  0
 ...le-conversion-enable-for-microblaze.patch} |  0
 .../qt5base/{5.12.4 => 5.12.5}/qt5base.hash   |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |  4 +-
 package/qt5/qt5charts/qt5charts.hash          |  4 +-
 .../{5.12.4 => 5.12.5}/qt5connectivity.hash   |  4 +-
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 .../qt5/qt5declarative/qt5declarative.hash    |  4 +-
 .../qt5graphicaleffects.hash                  |  4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |  4 +-
 package/qt5/qt5location/qt5location.hash      |  4 +-
 ...en-no-opengl-in-QVideoSurfacePainter.patch | 47 ------------
 package/qt5/qt5multimedia/qt5multimedia.hash  |  4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |  4 +-
 .../{5.12.4 => 5.12.5}/qt5quickcontrols2.hash |  4 +-
 package/qt5/qt5script/qt5script.hash          |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |  4 +-
 ...er-error-SIOCGSTAMP-was-not-declared.patch | 36 ---------
 .../{5.12.4 => 5.12.5}/qt5serialbus.hash      |  4 +-
 .../{5.12.4 => 5.12.5}/qt5serialport.hash     |  4 +-
 package/qt5/qt5svg/qt5svg.hash                |  4 +-
 package/qt5/qt5tools/qt5tools.hash            |  4 +-
 .../qt5virtualkeyboard.hash                   |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |  4 +-
 .../{5.12.4 => 5.12.5}/qt5webengine.hash      |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash  |  4 +-
 .../{5.12.4 => 5.12.5}/qt5x11extras.hash      |  4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  4 +-
 33 files changed, 53 insertions(+), 211 deletions(-)
 delete mode 100644 package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
 rename package/qt5/qt5base/{5.12.4 => 5.12.5}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.4/0004-double-conversion-enable-for-microblaze.patch => 5.12.5/0002-double-conversion-enable-for-microblaze.patch} (100%)
 rename package/qt5/qt5base/{5.12.4 => 5.12.5}/qt5base.hash (81%)
 rename package/qt5/qt5connectivity/{5.12.4 => 5.12.5}/qt5connectivity.hash (74%)
 rename package/qt5/qt5declarative/{5.12.4 => 5.12.5}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 delete mode 100644 package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
 rename package/qt5/qt5quickcontrols2/{5.12.4 => 5.12.5}/qt5quickcontrols2.hash (65%)
 delete mode 100644 package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
 rename package/qt5/qt5serialbus/{5.12.4 => 5.12.5}/qt5serialbus.hash (71%)
 rename package/qt5/qt5serialport/{5.12.4 => 5.12.5}/qt5serialport.hash (74%)
 rename package/qt5/qt5virtualkeyboard/{5.12.4 => 5.12.5}/qt5virtualkeyboard.hash (78%)
 rename package/qt5/qt5webengine/{5.12.4 => 5.12.5}/qt5webengine.hash (99%)
 rename package/qt5/qt5x11extras/{5.12.4 => 5.12.5}/qt5x11extras.hash (74%)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 468c1ac4d5..8169faf7c7 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).4
+QT5_VERSION = $(QT5_VERSION_MAJOR).5
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 6cf05c0ba4..a731bf764f 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qt3d-everywhere-src-5.12.4.tar.xz.sha256
-sha256 cfad2e16f40fa07f8be59fa29c0c246743ee67db417ca29772a92f36fa322af3 qt3d-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qt3d-everywhere-src-5.12.5.tar.xz.sha256
+sha256 2a35b144768c7ad8a9265d16a04f038d9bc51016bd2c4b2b516e374f81ff29c4  qt3d-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch b/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
deleted file mode 100644
index 5081d56b4b..0000000000
--- a/package/qt5/qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 23e437bb5cba5b13ee327c36d8199a49aad9a8da Mon Sep 17 00:00:00 2001
-From: Joerg Bornemann <joerg.bornemann@qt.io>
-Date: Wed, 31 Jul 2019 10:55:14 +0200
-Subject: [PATCH] Fix dependency_libs entry of .la files
-
-Libtool cannot cope with absolute paths in the dependency_libs entry.
-We split absolute paths into -L and -l here.
-
-Change-Id: I30bf11e490d1993d2a4d88c114e07bbae12def6d
-Fixes: QTBUG-76625
-
-Upstream: https://codereview.qt-project.org/c/qt/qtbase/+/269146
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- qmake/generators/unix/unixmake2.cpp | 36 +++++++++++++++++++++++++----
- 1 file changed, 31 insertions(+), 5 deletions(-)
-
-diff --git a/qmake/generators/unix/unixmake2.cpp b/qmake/generators/unix/unixmake2.cpp
-index d9bcccf2e2..ddc3b063d4 100644
---- a/qmake/generators/unix/unixmake2.cpp
-+++ b/qmake/generators/unix/unixmake2.cpp
-@@ -1450,6 +1450,33 @@ UnixMakefileGenerator::libtoolFileName(bool fixify)
- void
- UnixMakefileGenerator::writeLibtoolFile()
- {
-+    auto fixAbsolutePaths
-+            = [this](const ProStringList &libs)
-+              {
-+                  ProStringList result;
-+                  for (auto lib : libs) {
-+                      auto fi = fileInfo(lib.toQString());
-+                      if (fi.isAbsolute()) {
-+                          const QString libDirArg = "-L" + fi.path();
-+                          if (!result.contains(libDirArg))
-+                              result += libDirArg;
-+                          QString namespec = fi.fileName();
-+                          int dotPos = namespec.lastIndexOf('.');
-+                          if (dotPos != -1 && namespec.startsWith("lib")) {
-+                              namespec.truncate(dotPos);
-+                              namespec.remove(0, 3);
-+                          } else {
-+                              namespec.prepend(':');
-+                          }
-+                          result += "-l" + namespec;
-+                      } else {
-+
-+                          result += lib;
-+                      }
-+                  }
-+                  return result;
-+              };
-+
-     QString fname = libtoolFileName(), lname = fname;
-     mkdir(fileInfo(fname).path());
-     int slsh = lname.lastIndexOf(Option::dir_sep);
-@@ -1488,12 +1515,11 @@ UnixMakefileGenerator::writeLibtoolFile()
-                          << ".a'\n\n";
-
-     t << "# Libraries that this one depends upon.\n";
-+    static const ProKey libVars[] = { "LIBS", "QMAKE_LIBS" };
-     ProStringList libs;
--    libs << "LIBS" << "QMAKE_LIBS";
--    t << "dependency_libs='";
--    for (ProStringList::ConstIterator it = libs.begin(); it != libs.end(); ++it)
--        t << fixLibFlags((*it).toKey()).join(' ') << ' ';
--    t << "'\n\n";
-+    for (auto var : libVars)
-+        libs += fixLibFlags(var);
-+    t << "dependency_libs='" << fixAbsolutePaths(libs).join(' ') << "'\n\n";
-
-     t << "# Version information for " << lname << "\n";
-     int maj = project->first("VER_MAJ").toInt();
---
-2.22.0
-
diff --git a/package/qt5/qt5base/5.12.4/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.5/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.4/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.4/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.5/0002-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.4/qt5base.hash b/package/qt5/qt5base/5.12.5/qt5base.hash
similarity index 81%
rename from package/qt5/qt5base/5.12.4/qt5base.hash
rename to package/qt5/qt5base/5.12.5/qt5base.hash
index 5e507ccc0a..6689d09efc 100644
--- a/package/qt5/qt5base/5.12.4/qt5base.hash
+++ b/package/qt5/qt5base/5.12.5/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtbase-everywhere-src-5.12.4.tar.xz.sha256
-sha256 20fbc7efa54ff7db9552a7a2cdf9047b80253c1933c834f35b0bc5c1ae021195 qtbase-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtbase-everywhere-src-5.12.5.tar.xz.sha256
+sha256 fc8abffbbda9da3e593d8d62b56bc17dbaab13ff71b72915ddda11dabde4d625 qtbase-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 6173ec7453..a098ad7de0 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtcanvas3d-everywhere-src-5.12.4.tar.xz.sha256
-sha256 d7e0e8aa542d077a929fb7700411ca9de1f65ae4748d64168d2e7533facd7869 qtcanvas3d-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcanvas3d-everywhere-src-5.12.5.tar.xz.sha256
+sha256 1553e06ce3cc5afb36aed3698b85c00e734eac07f7f41895426bebd84216d80c  qtcanvas3d-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 25d821700a..adc860f41a 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtcharts-everywhere-src-5.12.4.tar.xz.sha256
-sha256 06ff68a80dc377847429cdd87d4e46465e1d6fbc417d52700a0a59d197669c9e qtcharts-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtcharts-everywhere-src-5.12.5.tar.xz.sha256
+sha256 4c7c30a916ba0100a1635b89f48bc5a8af4cdedac79c3fc18456af54dc0a6608  qtcharts-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
index 3afaffa9c8..da757aef77 100644
--- a/package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.5/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtconnectivity-everywhere-src-5.12.4.tar.xz.sha256
-sha256 749d05242b9fae12e80f569fb6b918dc011cb191eeb05147cbde474ca6b173ef qtconnectivity-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtconnectivity-everywhere-src-5.12.5.tar.xz.sha256
+sha256 bdf62c72d689f47c4d17ecdde934d9f85a1164091e58fce02873de259e8de88b  qtconnectivity-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.4/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.4/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.5/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e1c24c93c7..6bac255578 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtdeclarative-everywhere-src-5.12.4.tar.xz.sha256
-sha256 614105ed73079d67d81b34fef31c9934c5e751342e4b2e0297128c8c301acda7 qtdeclarative-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtdeclarative-everywhere-src-5.12.5.tar.xz.sha256
+sha256 22c5323d4b01259e6e352eef1b54129d6dfee00a406f0312905fa7db322b9190  qtdeclarative-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 7abdfa117e..b9cfe357f8 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtgraphicaleffects-everywhere-src-5.12.4.tar.xz.sha256
-sha256 0bc38b168fa724411984525173d667aa47076c8cbd4eeb791d0da7fe4b9bdf73 qtgraphicaleffects-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtgraphicaleffects-everywhere-src-5.12.5.tar.xz.sha256
+sha256 bdbddba7e0e0d041809a98d97c07da8be8936ec48537335cbaea9b0049c646ad  qtgraphicaleffects-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index bf7a06d017..6215852a95 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtimageformats-everywhere-src-5.12.4.tar.xz.sha256
-sha256 2dee25c3eea90d172cbd40f41450153322b902da1daa7d2370a55124b2307bb3 qtimageformats-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtimageformats-everywhere-src-5.12.5.tar.xz.sha256
+sha256 9f19394830542fb9e6bde6806b6216b7207f96bff674b91e8e8a8f89699e1f0a  qtimageformats-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 656243eca5..27ad8efd9e 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtlocation-everywhere-src-5.12.4.tar.xz.sha256
-sha256 127b40bd7679fead3fb98f4c9c1d71dde9d6d416e90a6000129b61a5f128b3a0 qtlocation-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtlocation-everywhere-src-5.12.5.tar.xz.sha256
+sha256 12c8b59755abc4ca56e135e8ae3db7c6ba1bd95c779060f10a01393ae1040122  qtlocation-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch b/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
deleted file mode 100644
index 1dc7701c08..0000000000
--- a/package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9bbf9f0d862b8d458e59690d36641618fb101b4e Mon Sep 17 00:00:00 2001
-From: Val Doroshchuk <valentyn.doroshchuk@qt.io>
-Date: Mon, 17 Jun 2019 15:20:22 +0200
-Subject: Fix compile issue when no opengl in QVideoSurfacePainter
-
-error: invalid use of incomplete type 'class QGLContext'
-
-Change-Id: I4bc9bd4231e663b187d3cef917b7a551ba614ba9
-Fixes: QTBUG-76405
-Reviewed-by: Andy Shaw <andy.shaw@qt.io>
-
-[Retrieved from:
-https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=9bbf9f0d862b8d458e59690d36641618fb101b4e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/multimediawidgets/qpaintervideosurface.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
-index 440d5c858..6af0c7588 100644
---- a/src/multimediawidgets/qpaintervideosurface.cpp
-+++ b/src/multimediawidgets/qpaintervideosurface.cpp
-@@ -57,10 +57,6 @@
- #ifndef GL_RGB8
- #define GL_RGB8 0x8051
- #endif
--#endif
--
--#include <QtDebug>
--QT_BEGIN_NAMESPACE
- 
- static void makeCurrent(QGLContext *context)
- {
-@@ -70,6 +66,10 @@ static void makeCurrent(QGLContext *context)
-     if (handle && QOpenGLContext::currentContext() != handle)
-         handle->makeCurrent(handle->surface());
- }
-+#endif
-+
-+#include <QtDebug>
-+QT_BEGIN_NAMESPACE
- 
- QVideoSurfacePainter::~QVideoSurfacePainter()
- {
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 927123e83c..93bb6f1ccc 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtmultimedia-everywhere-src-5.12.4.tar.xz.sha256
-sha256 7c0759ab6fca2480b10b71a35beeffe0b847adeff5af94eacd1a4531d033423d qtmultimedia-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtmultimedia-everywhere-src-5.12.5.tar.xz.sha256
+sha256 d5a0a4fddc5ef14d641160a1fc0011b190ff8d9f19009498d586516b8ee3479c  qtmultimedia-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index a3a01364ce..71727972b4 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtquickcontrols-everywhere-src-5.12.4.tar.xz.sha256
-sha256 32d4c2505337c67b0bac26d7f565ec8fabdc616e61247e98674820769dda9858 qtquickcontrols-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols-everywhere-src-5.12.5.tar.xz.sha256
+sha256 46deaefbdac3daa576c748e807956f5f82b2318923b1a36e434a3ff32d1d2559  qtquickcontrols-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
similarity index 65%
rename from package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
index b5e897654f..e886661527 100644
--- a/package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.5/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtquickcontrols2-everywhere-src-5.12.4.tar.xz.sha256
-sha256 9a447eed38bc8c7d7be7bc407317f58940377c077ddca74c9a641b1ee6200331 qtquickcontrols2-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtquickcontrols2-everywhere-src-5.12.5.tar.xz.sha256
+sha256 d744bdc492486db6cb521b1d4891e2358719399825ca1cf2a50968a80f6acb8f  qtquickcontrols2-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index c40b842f3f..86381865e7 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtscript-everywhere-src-5.12.4.tar.xz.sha256
-sha256 7adb3fe77638c7a6f2a26bca850b0ff54f5fb7e5561d2e4141d14a84305c2b6a qtscript-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscript-everywhere-src-5.12.5.tar.xz.sha256
+sha256 0083734ae827840334b774decb15de37f1b4ea5c88e442e2f485c530f24f1df4  qtscript-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 5a4b58a0ad..e24cdfd445 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtscxml-everywhere-src-5.12.4.tar.xz.sha256
-sha256 696fb72a62018151275fe589fc80cb160d2becab9a3254321d40e2e11a0ad4f8 qtscxml-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtscxml-everywhere-src-5.12.5.tar.xz.sha256
+sha256 6f1ec74100cdb2e7dfc3535e09d356fc53ba42e61b32fc3b93d5a7efed49960c  qtscxml-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 69db8df051..3dc2d7ddb5 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtsensors-everywhere-src-5.12.4.tar.xz.sha256
-sha256 95873c7ea5960008d6eb41368ca64d68fbd05594ca8c2cd848b1612fc4aec0a9 qtsensors-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsensors-everywhere-src-5.12.5.tar.xz.sha256
+sha256 e3a86a706f475bb23fc874de56026482de223ebd24f8cb4e94a28d1985ca0b85  qtsensors-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch b/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
deleted file mode 100644
index 8573e304fa..0000000000
--- a/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 43d746c2c0c87c8694e835f3b052317c8fa02482 Mon Sep 17 00:00:00 2001
-From: Andre Hartmann <aha_1980@gmx.de>
-Date: Mon, 8 Jul 2019 21:35:12 +0200
-Subject: =?UTF-8?q?SocketCAN:=20Fix=20compiler=20error=20"=E2=80=98SIOCGST?=
- =?UTF-8?q?AMP=E2=80=99=20was=20not=20declared"?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: QTBUG-76957
-Change-Id: I8c4c86aa23137d67f5d20eedfe1c46a241c0632b
-Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
-Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
-
-[Retrieved from:
-https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/plugins/canbus/socketcan/socketcanbackend.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/plugins/canbus/socketcan/socketcanbackend.cpp b/src/plugins/canbus/socketcan/socketcanbackend.cpp
-index 74b0d1d..a2da146 100644
---- a/src/plugins/canbus/socketcan/socketcanbackend.cpp
-+++ b/src/plugins/canbus/socketcan/socketcanbackend.cpp
-@@ -45,6 +45,7 @@
- 
- #include <linux/can/error.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <errno.h>
- #include <unistd.h>
- #include <net/if.h>
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
similarity index 71%
rename from package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
index d81c73d86b..7ce82a33ef 100644
--- a/package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.5/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtserialbus-everywhere-src-5.12.4.tar.xz.sha256
-sha256 69d56905f43ee13e670750e8f46d373835fae81d6343baa7c4004d2a2c6311fc qtserialbus-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialbus-everywhere-src-5.12.5.tar.xz.sha256
+sha256 8474ae61a703c56e327ae0755c27643f2eafe0d915e8c6afb21728548dc02c22  qtserialbus-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.4/qt5serialport.hash b/package/qt5/qt5serialport/5.12.5/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.4/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.5/qt5serialport.hash
index 6b93cf5c27..3edb832537 100644
--- a/package/qt5/qt5serialport/5.12.4/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.5/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtserialport-everywhere-src-5.12.4.tar.xz.mirrorlist
-sha256 bf487df8a9fb2eddf103842b57a75b17ef4c498ee40306ae9997017c82b0ad39 qtserialport-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtserialport-everywhere-src-5.12.5.tar.xz.mirrorlist
+sha256 f8ef0321a59ecfe2c72adc2ee220e0047403439a3c7b9efb719b1476af1fb862 qtserialport-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 54523ea5a4..5c5300ae68 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtsvg-everywhere-src-5.12.4.tar.xz.sha256
-sha256 110812515a73c650e5ebc41305d9a243dadeb21f485aaed773e394dd84ce0d04 qtsvg-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtsvg-everywhere-src-5.12.5.tar.xz.sha256
+sha256 75a791cf749f671d7ea9090b403ca513f745795018db512e7eecbf418b679840  qtsvg-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 2f9af2be6d..344cc0a9d2 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qttools-everywhere-src-5.12.4.tar.xz.sha256
-sha256 3b0e353860a9c0cd4db9eeae5f94fef8811ed7d107e3e5e97e4a557f61bd6eb6 qttools-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qttools-everywhere-src-5.12.5.tar.xz.sha256
+sha256 28e095047b4985437dd66120cbcb49ac091bf4f12576ecad7ebc781b7dd44025  qttools-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
index 10960b1cfa..4b086f81aa 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.5/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtvirtualkeyboard-everywhere-src-5.12.4.tar.xz.sha256
-sha256 33ac0356f916995fe5a91582e12b4c4f730c705808ea3c14e75c6e350e8131e6 qtvirtualkeyboard-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz.sha256
+sha256 786d745b34b1f145073488d492325e98bcde81b07ab984032ea5eb2fb52e6e5e  qtvirtualkeyboard-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index a511ee6071..523ef9e9f2 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwayland-everywhere-src-5.12.4.tar.xz.sha256
-sha256 2fade959c3927687134c597d85c12ba1af22129a60ab326c2dc77a648e74e6b7 qtwayland-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwayland-everywhere-src-5.12.5.tar.xz.sha256
+sha256 29fd31267149451f93faa15f031e0a14506e704086033f70d51479522c6f3846  qtwayland-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 4712349f79..42b2d9a6fe 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebchannel-everywhere-src-5.12.4.tar.xz.sha256
-sha256 ab571a1b699e61a86be1a6b8d6ffd998d431c4850cc27e9a21f81fa5923bfdb7 qtwebchannel-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebchannel-everywhere-src-5.12.5.tar.xz.sha256
+sha256 9f1d1ac20722ee053ecf071d4ec0070a45a765cb67b6e31add61004fb4b3c5e8  qtwebchannel-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.4/qt5webengine.hash b/package/qt5/qt5webengine/5.12.5/qt5webengine.hash
similarity index 99%
rename from package/qt5/qt5webengine/5.12.4/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.5/qt5webengine.hash
index 232807f0cd..0956f504ed 100644
--- a/package/qt5/qt5webengine/5.12.4/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.5/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebengine-everywhere-src-5.12.4.tar.xz.sha256
-sha256 fccf5c945412c19c3805323211b504ac8becbf191c638a2dc85ec91abfb1b331 qtwebengine-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebengine-everywhere-src-5.12.5.tar.xz.sha256
+sha256 31881130e69eb8336e9480f9f33cd5a93e86de8d7323c0ae1893e1a72ce70743  qtwebengine-everywhere-src-5.12.5.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index e4286d3239..ae3b7c83e7 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebsockets-everywhere-src-5.12.4.tar.xz.sha256
-sha256 b471eda2f486d21c51fc3bc53bb8844022117e746d5f15c5eabb82cd37eb2abe qtwebsockets-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtwebsockets-everywhere-src-5.12.5.tar.xz.sha256
+sha256 5d58e697c49c0ea19a8299deba84b5360dca8c336a1636d38de0351757293262  qtwebsockets-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
index a9657493e5..b8f425109c 100644
--- a/package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.5/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtx11extras-everywhere-src-5.12.4.tar.xz.mirrorlist
-sha256 49cc009eaf4a01ca7dbe12651ef39de9a43860acb674aec372e70b209f9bae1e qtx11extras-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtx11extras-everywhere-src-5.12.5.tar.xz.mirrorlist
+sha256 89425af3e48b040878c6a64ace58c17a83b87c9330e6366b09a41d6797062a68 qtx11extras-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index ca47666a0f..a5ec76dbb2 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtxmlpatterns-everywhere-src-5.12.4.tar.xz.sha256
-sha256 0bea1719bb948f65cbed4375cc3e997a6464f35d25b631bafbd7a3161f8f5666 qtxmlpatterns-everywhere-src-5.12.4.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.5/submodules/qtxmlpatterns-everywhere-src-5.12.5.tar.xz.sha256
+sha256 b905d9107f87798ef0f142942fc45c0f63fc113522ab041e791d3cb744a8babd  qtxmlpatterns-everywhere-src-5.12.5.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.20.1
