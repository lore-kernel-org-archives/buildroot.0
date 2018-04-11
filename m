From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Apr 2018 12:01:46 +0200
Subject: [Buildroot] [V2] chipmunk: new package
Message-ID: <20180411100146.19494-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/chipmunk/Config.in     | 12 ++++++++++++
 package/chipmunk/chipmunk.hash |  5 +++++
 package/chipmunk/chipmunk.mk   | 16 ++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/chipmunk/Config.in
 create mode 100644 package/chipmunk/chipmunk.hash
 create mode 100644 package/chipmunk/chipmunk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54d9..c978a5601 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -657,6 +657,7 @@ F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
+F:	pacakge/chipmunk/
 F:	package/dado/
 F:	package/ficl/
 F:	package/gdbm/
diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c08..94347edbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1097,6 +1097,7 @@ menu "Graphics"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
+	source "package/chipmunk/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
diff --git a/package/chipmunk/Config.in b/package/chipmunk/Config.in
new file mode 100644
index 000000000..7275d684a
--- /dev/null
+++ b/package/chipmunk/Config.in
@@ -0,0 +1,12 @@
+
+comment "chipmunk needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_CHIPMUNK
+	bool "chipmunk"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Chipmunk2D is a simple, lightweight, fast and portable 2D
+	  rigid body physics library written in C.
+
+	  http://chipmunk-physics.net/
diff --git a/package/chipmunk/chipmunk.hash b/package/chipmunk/chipmunk.hash
new file mode 100644
index 000000000..7bd9b1569
--- /dev/null
+++ b/package/chipmunk/chipmunk.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256	6b6d8d5d910c4442fb9c8c4c46a178126d8c21d075cdb3ce439a7f8d8757b0ca  Chipmunk-7.0.2.tar.gz
+
+# Hash for license file:
+sha256	109cedb0301cba4e05fa99241f162bdad015c9541ae84b420b0148ac1ea588e2  LICENSE.txt
diff --git a/package/chipmunk/chipmunk.mk b/package/chipmunk/chipmunk.mk
new file mode 100644
index 000000000..61b7a2e7b
--- /dev/null
+++ b/package/chipmunk/chipmunk.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# chipmunk
+#
+################################################################################
+
+CHIPMUNK_VERSION = 7.0.2
+CHIPMUNK_SITE = https://github.com/slembcke/Chipmunk2D/archive
+CHIPMUNK_SOURCE = Chipmunk-$(CHIPMUNK_VERSION).tar.gz
+CHIPMUNK_INSTALL_STAGING = YES
+CHIPMUNK_LICENSE = MIT
+CHIPMUNK_LICENSE_FILES = LICENSE.txt
+CHIPMUNK_DEPENDENCIES = libgl
+CHIPMUNK_CONF_OPTS = -DBUILD_DEMOS=OFF
+
+$(eval $(cmake-package))
-- 
2.11.0
