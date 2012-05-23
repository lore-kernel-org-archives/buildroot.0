From: Julian Lunz <git@jlunz.de>
Date: Wed, 23 May 2012 22:51:07 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
Message-ID: <1337806267-32327-1-git-send-email-git@jlunz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julian Lunz <git@jlunz.de>
---
 package/Config.in          |    1 +
 package/freerdp/Config.in  |   11 +++++++++++
 package/freerdp/freerdp.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/freerdp/Config.in
 create mode 100644 package/freerdp/freerdp.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..2d1f18d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -152,6 +152,7 @@ source "package/leafpad/Config.in"
 source "package/midori/Config.in"
 source "package/pcmanfm/Config.in"
 source "package/rdesktop/Config.in"
+source "package/freerdp/Config.in"
 source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
new file mode 100644
index 0000000..1cc49c9
--- /dev/null
+++ b/package/freerdp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FREERDP
+	bool "freerdp"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	depends on BR2_PACKAGE_XORG7
+	help
+	  FreeRDPFreeRDP is a free implementation of the 
+	  Remote Desktop Protocol (RDP), released under the Apache license
+
+	  http://www.freerdp.com/
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
new file mode 100644
index 0000000..61b6ca2
--- /dev/null
+++ b/package/freerdp/freerdp.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# FreeRDP
+#
+#############################################################
+
+FREERDP_VERSION = 1.0.1
+FREERDP_SOURCE = freerdp-$(FREERDP_VERSION).tar.gz
+FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
+FREERDP_CONF_OPT = -DWITH_CUPS=OFF -DWITH_FFMPEG=OFF -DWITH_ALSA=OFF -DWITH_XINERAMA=OFF
+FREERDP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt zlib
+
+$(eval $(call CMAKETARGETS))
-- 
1.7.0.4
