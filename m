From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 11 Sep 2009 12:47:50 +0200
Subject: [Buildroot] [PATCH] divine: new package
Message-ID: <1252666070-20728-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DiVine is the DirectFB virtual input extension.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in        |    1 +
 package/divine/Config.in |    8 ++++++++
 package/divine/divine.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/divine/Config.in
 create mode 100644 package/divine/divine.mk

diff --git a/package/Config.in b/package/Config.in
index 94c2458..7273e2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,6 +303,7 @@ source "package/dialog/Config.in"
 comment "graphic libraries"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
+source "package/divine/Config.in"
 source "package/fbdump/Config.in"
 source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"
diff --git a/package/divine/Config.in b/package/divine/Config.in
new file mode 100644
index 0000000..8202292
--- /dev/null
+++ b/package/divine/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DIVINE
+       bool "directfb virtual input extension"
+       depends on BR2_PACKAGE_DIRECTFB
+       help
+         DiVine provides a DirectFB input driver that reads input
+         events from a pipe and dispatches them via a virtual input
+         device. It also installs the tool 'spooky' that allows to
+         send input events to DirectFB applications.
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
new file mode 100644
index 0000000..554ee63
--- /dev/null
+++ b/package/divine/divine.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# divine
+#
+#############################################################
+
+DIVINE_VERSION := 0.4.0
+DIVINE_SITE := http://www.directfb.org/downloads/Extras
+DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
+DIVINE_INSTALL_STAGING = YES
+DIVINE_INSTALL_TARGET = YES
+DIVINE_DEPENDENCIES = directfb
+
+$(eval $(call AUTOTARGETS,package,divine))
-- 
1.6.0.4
