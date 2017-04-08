From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:27:33 +0200
Subject: [Buildroot] [git commit] qt5declarative: fix examples compile
	without qt widgets module
Message-ID: <20170408132738.234D58229C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5d142e719ecebaf3080ab20e564cb7aef1e23c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  .../qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
  Project ERROR: Unknown module(s) in QT: widgets

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...xamples-photoviewer-needs-widgets-support.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/qt5/qt5declarative/0001-examples-photoviewer-needs-widgets-support.patch b/package/qt5/qt5declarative/0001-examples-photoviewer-needs-widgets-support.patch
new file mode 100644
index 0000000..aeaaa91
--- /dev/null
+++ b/package/qt5/qt5declarative/0001-examples-photoviewer-needs-widgets-support.patch
@@ -0,0 +1,32 @@
+From b616a7e2a7e03e2eb189dca3dc428c0e19e1652b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 6 Apr 2017 21:53:40 +0200
+Subject: [PATCH] examples: photoviewer needs widgets support
+
+Fixes:
+
+  .../qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
+  Project ERROR: Unknown module(s) in QT: widgets
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/quick/demos/demos.pro | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/examples/quick/demos/demos.pro b/examples/quick/demos/demos.pro
+index 0644b81a2..5a6fd52ba 100644
+--- a/examples/quick/demos/demos.pro
++++ b/examples/quick/demos/demos.pro
+@@ -7,5 +7,7 @@ SUBDIRS = samegame \
+             photosurface \
+             stocqt
+ 
+-qtHaveModule(xmlpatterns): SUBDIRS += rssnews photoviewer
+-
++qtHaveModule(xmlpatterns) {
++    SUBDIRS += rssnews
++    qtHaveModule(widgets): SUBDIRS += photoviewer
++}
+-- 
+2.11.0
+
