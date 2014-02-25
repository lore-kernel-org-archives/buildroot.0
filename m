From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 20:58:06 +0100
Subject: [Buildroot] [git commit] qt5connectivity: Don't build scanner
	example without QtQuick
Message-ID: <20140225200719.AAF849B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c5156cce0f9af0a3e35dfc998b9841dae1f58cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply upstream patch to fix this problem:

make[3]: Entering directory
`/home/test/test/3/output/build/qt5connectivity-5.2.0/examples/bluetooth'
cd scanner/ && ( test -e Makefile ||
/home/test/test/3/output/host/usr/bin/qmake
/home/test/test/3/output/build/qt5connectivity-5.2.0/examples/bluetooth/scanner/scanner.pro
-o Makefile ) && /usr/bin/make -f Makefile Project ERROR: Unknown
module(s) in QT: quick

Fixes:
   http://autobuild.buildroot.net/results/163/1635e4d385293ea560107bdf624033e8ffefbe72/

Upstream patch URL:
   https://qt.gitorious.org/qt/qtconnectivity/commit/1454664752505f5870e4173d15362bfdfe4148e7/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n_t-build-scanner-example-without-qtquick.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch b/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch
new file mode 100644
index 0000000..0751ba7
--- /dev/null
+++ b/package/qt5/qt5connectivity/qt5connectivity-0001-don_t-build-scanner-example-without-qtquick.patch
@@ -0,0 +1,30 @@
+qt5connectivity: Don't build scanner example without QtQuick
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 1454664752505f5870e4173d15362bfdfe4148e7 Mon Sep 17 00:00:00 2001
+From: Alex Blasche <alexander.blasche@digia.com>
+Date: Wed, 15 Jan 2014 12:11:31 +0100
+Subject: [PATCH] Don't build scanner example without QtQuick
+
+Task-number: QTBUG-35711
+Change-Id: I0406fb5edd8fb2a90046308853485eaaa4311a26
+Reviewed-by: Friedemann Kleint <Friedemann.Kleint@digia.com>
+Reviewed-by: Fabian Bumberger <fbumberger@rim.com>
+Reviewed-by: Alex Blasche <alexander.blasche@digia.com>
+---
+ examples/bluetooth/bluetooth.pro |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/examples/bluetooth/bluetooth.pro b/examples/bluetooth/bluetooth.pro
+index e3ef769..549bb7c 100644
+--- a/examples/bluetooth/bluetooth.pro
++++ b/examples/bluetooth/bluetooth.pro
+@@ -6,4 +6,4 @@ qtHaveModule(widgets) {
+                bttennis
+ }
+ 
+-SUBDIRS += scanner
++qtHaveModule(quick): SUBDIRS += scanner
+-- 
+1.7.1
+
