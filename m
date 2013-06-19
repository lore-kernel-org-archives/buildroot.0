From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 22:51:36 +0200
Subject: [Buildroot] [git commit] libqmi: new package
Message-ID: <20130619205401.A200E9AF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=211a5df280ac463da4c8f3ad0539455f206aa04d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libqmi is a glib-based library for talking to WWAN modems and devices which
speak the Qualcomm MSM Interface (QMI) protocol.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libqmi/Config.in |    9 +++++++++
 package/libqmi/libqmi.mk |   16 ++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5b066dc..426004b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
+source "package/libqmi/Config.in"
 source "package/libserial/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
new file mode 100644
index 0000000..c5e8a5c
--- /dev/null
+++ b/package/libqmi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBQMI
+	bool "libqmi"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	help
+	  libqmi is a glib-based library for talking to WWAN modems and devices
+	  which speak the Qualcomm MSM Interface (QMI) protocol.
+
+	  http://www.freedesktop.org/wiki/Software/libqmi/
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
new file mode 100644
index 0000000..911b1a7
--- /dev/null
+++ b/package/libqmi/libqmi.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libqmi
+#
+################################################################################
+
+LIBQMI_VERSION = 1.4.0
+LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
+LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
+LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
+LIBQMI_LICENSE_FILES = COPYING
+LIBQMI_INSTALL_STAGING = YES
+
+LIBQMI_DEPENDENCIES = libglib2
+
+$(eval $(autotools-package))
