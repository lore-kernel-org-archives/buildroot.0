From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 19 Apr 2018 18:00:02 +0200
Subject: [Buildroot] [PATCH] box2d: new package
Message-ID: <20180419160002.9938-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/box2d/Config.in  | 11 +++++++++++
 package/box2d/box2d.hash |  5 +++++
 package/box2d/box2d.mk   | 15 +++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/box2d/Config.in
 create mode 100644 package/box2d/box2d.hash
 create mode 100644 package/box2d/box2d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 71c0e0038..63fc0cd8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -664,6 +664,7 @@ F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
+F:	package/box2d/
 F:	pacakge/chipmunk/
 F:	package/dado/
 F:	package/ficl/
diff --git a/package/Config.in b/package/Config.in
index b759a1a1b..f75da72e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,6 +1095,7 @@ menu "Graphics"
 	source "package/assimp/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
+	source "package/box2d/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
diff --git a/package/box2d/Config.in b/package/box2d/Config.in
new file mode 100644
index 000000000..94dac42e5
--- /dev/null
+++ b/package/box2d/Config.in
@@ -0,0 +1,11 @@
+
+config BR2_PACKAGE_BOX2D
+	bool "box2d"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Box2D is a 2-dimensional physics simulator engine.
+
+	  http://box2d.org/
+
+comment "box2d needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/box2d/box2d.hash b/package/box2d/box2d.hash
new file mode 100644
index 000000000..e1c33a6ee
--- /dev/null
+++ b/package/box2d/box2d.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256	75d62738b13d2836cd56647581b6e574d4005a6e077ddefa5d727d445d649752  box2d-v2.3.1.tar.gz
+
+# Hash for license file:
+sha256	1d1b742fca54f2a4cf3709fd055f545fd4926d0f2eba64ff041d3d28fa1cee77  Box2D/License.txt
diff --git a/package/box2d/box2d.mk b/package/box2d/box2d.mk
new file mode 100644
index 000000000..a1ebdc65c
--- /dev/null
+++ b/package/box2d/box2d.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# box2d
+#
+################################################################################
+
+BOX2D_VERSION = v2.3.1
+BOX2D_SITE = $(call github,erincatto,Box2D,$(BOX2D_VERSION))
+BOX2D_INSTALL_STAGING = YES
+BOX2D_LICENSE = Zlib
+BOX2D_LICENSE_FILES = Box2D/License.txt
+BOX2D_SUBDIR = Box2D
+BOX2D_CONF_OPTS = -DBOX2D_BUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
-- 
2.11.0
