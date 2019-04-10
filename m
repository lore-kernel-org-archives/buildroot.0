From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Apr 2019 19:57:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/gli: new package
Message-ID: <20190410175746.32756-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Kodi 18.x-compatible version of kodi-screensaver-rsxs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/gli/Config.in | 10 ++++++++++
 package/gli/gli.hash  |  3 +++
 package/gli/gli.mk    | 17 +++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/gli/Config.in
 create mode 100644 package/gli/gli.hash
 create mode 100644 package/gli/gli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d11a5a33af..f9b8a70476 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -297,6 +297,7 @@ F:	package/freeswitch-mod-bcg729/
 F:	package/fstrcmp/
 F:	package/ghostscript/
 F:	package/giflib/
+F:	package/gli/
 F:	package/glmark2/
 F:	package/hdparm/
 F:	package/jsoncpp/
diff --git a/package/Config.in b/package/Config.in
index a99769032a..ff1c01dc24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1661,6 +1661,7 @@ menu "Other"
 	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
+	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
diff --git a/package/gli/Config.in b/package/gli/Config.in
new file mode 100644
index 0000000000..da7ce28ba1
--- /dev/null
+++ b/package/gli/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GLI
+	bool "gli"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  OpenGL Image (GLI)
+
+	  http://gli.g-truc.net
+
+comment "gli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gli/gli.hash b/package/gli/gli.hash
new file mode 100644
index 0000000000..177358a758
--- /dev/null
+++ b/package/gli/gli.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
+sha256 e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
new file mode 100644
index 0000000000..6a332d0e08
--- /dev/null
+++ b/package/gli/gli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gli
+#
+################################################################################
+
+GLI_VERSION = 559cbe1ec38878e182507d331e0780fbae5baf15
+GLI_SITE = $(call github,g-truc,gli,$(GLI_VERSION))
+GLI_LICENSE = MIT
+GLI_LICENSE_FILES = manual.md
+
+# GLI is a header-only library, it only makes sense
+# to have it installed into the staging directory.
+GLI_INSTALL_STAGING = YES
+GLI_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.20.1
