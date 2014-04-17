From: Davide Viti <zinosat@tiscali.it>
Date: Thu, 17 Apr 2014 22:49:15 +0200
Subject: [Buildroot] [PATCH 1/1] qhull: new package
Message-ID: <1397767755-17045-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 package/Config.in       |  1 +
 package/qhull/Config.in | 13 +++++++++++++
 package/qhull/qhull.mk  | 15 +++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/qhull/Config.in
 create mode 100644 package/qhull/qhull.mk

diff --git a/package/Config.in b/package/Config.in
index 748d28e..44c35ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -820,6 +820,7 @@ source "package/p11-kit/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
+source "package/qhull/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tz/Config.in"
diff --git a/package/qhull/Config.in b/package/qhull/Config.in
new file mode 100644
index 0000000..e64025e
--- /dev/null
+++ b/package/qhull/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QHULL
+	bool "qhull"
+	help
+	  Qhull computes the convex hull, Delaunay triangulation,
+	  Voronoi diagram, halfspace intersection about a point,
+	  furthest-site Delaunay triangulation, and furthest-site
+	  Voronoi diagram. The source code runs in 2-d, 3-d, 4-d, and
+	  higher dimensions. Qhull implements the Quickhull algorithm
+	  for computing the convex hull. It handles roundoff errors
+	  from floating point arithmetic. It computes volumes, surface
+	  areas, and approximations to the convex hull.
+
+	  http://www.qhull.org
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
new file mode 100644
index 0000000..08d3fa4
--- /dev/null
+++ b/package/qhull/qhull.mk
@@ -0,0 +1,15 @@
+###############################################################################
+#
+# qhull
+#
+###############################################################################
+
+QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
+QHULL_SITE = git://gitorious.org/qhull/qhull.git
+QHULL_SITE_METHOD = git
+QHULL_INSTALL_STAGING = YES
+QHULL_LICENSE = BSD-Style
+QHULL_LICENSE_FILES = COPYING.txt
+QHULL_CONF_OPT = -DCMAKE_BUILD_TYPE=Release
+
+$(eval $(cmake-package))
-- 
1.9.1
