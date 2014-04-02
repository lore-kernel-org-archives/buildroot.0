From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:37 +0200
Subject: [Buildroot] [PATCH v2 23/41] libva-intel-driver: new package
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                |    1 +
 package/libva-intel-driver/Config.in             |   13 +++++++++++++
 package/libva-intel-driver/libva-intel-driver.mk |   13 +++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libva-intel-driver/Config.in
 create mode 100644 package/libva-intel-driver/libva-intel-driver.mk

diff --git a/package/Config.in b/package/Config.in
index b45c6e9..3550935 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -594,6 +594,7 @@ source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/libva/Config.in"
+source "package/libva-intel-driver/Config.in"
 source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
new file mode 100644
index 0000000..343f45f
--- /dev/null
+++ b/package/libva-intel-driver/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBVA_INTEL_DRIVER
+	bool "libva-intel-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBVA
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  VA-API back-end driver for Intel graphics chips
+
+	  https://01.org/linuxgraphics/community/vaapi
+
+comment "libva intel driver depends on libva & X.org"
+	depends on !BR2_PACKAGE_LIBVA || !BR2_PACKAGE_XORG7
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
new file mode 100644
index 0000000..86d2dcc
--- /dev/null
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libva-intel-driver
+#
+################################################################################
+
+LIBVA_INTEL_DRIVER_VERSION = 1.3.0
+LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
+LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
+LIBVA_INTEL_DRIVER_LICENSE = MIT
+LIBVA_INTEL_DRIVER_DEPENDENCIES = libva
+
+$(eval $(autotools-package))
-- 
1.7.10.4
