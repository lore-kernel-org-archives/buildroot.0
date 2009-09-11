From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Sep 2009 13:47:22 +0200
Subject: [Buildroot] [git commit master] divine: new package
Message-ID: <20090911114743.887CB7777B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1a0066b3dbda8a19b20b1d1e5bb52d7d011a89f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DiVine is the DirectFB virtual input extension.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/Config.in        |    1 +
 package/divine/Config.in |    8 ++++++++
 package/divine/divine.mk |   14 ++++++++++++++
 4 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 package/divine/Config.in
 create mode 100644 package/divine/divine.mk

diff --git a/CHANGES b/CHANGES
index 2197022..1250b94 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not yet released:
 
-	New packages: libarchive
+	New packages: divine, libarchive
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index cf4db52..fc97222 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -297,6 +297,7 @@ source "package/dialog/Config.in"
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
1.6.3.3
