From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 11:39:22 -0300
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
Message-ID: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/geoip/Config.in | 11 +++++++++++
 package/geoip/geoip.mk  | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/geoip/Config.in
 create mode 100644 package/geoip/geoip.mk

diff --git a/package/Config.in b/package/Config.in
index 9231c45..d9bd23d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -719,6 +719,7 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
+	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
diff --git a/package/geoip/Config.in b/package/geoip/Config.in
new file mode 100644
index 0000000..a198a31
--- /dev/null
+++ b/package/geoip/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GEOIP
+	bool "geoip"
+	help
+	  GeoIP is a C library that enables the user to find geographical
+	  and network information of an IP address.
+	  To use this library, you need to download MaxMind's free GeoLite or
+	  commercial GeoIP binary databases into the target's /usr/share/GeoIP
+	  directory in uncompressed form.
+	  Note that GeoIP2 / GeoLite2 are not supported by this library.
+
+	  https://github.com/maxmind/geoip-api-c
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
new file mode 100644
index 0000000..fde07cb
--- /dev/null
+++ b/package/geoip/geoip.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# geoip
+#
+################################################################################
+
+GEOIP_VERSION = 1.6.0
+GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
+GEOIP_SITE = $(call github,maxmind,geoip-api-c,v$(GEOIP_VERSION))
+GEOIP_AUTORECONF = YES
+GEOIP_INSTALL_STAGING = YES
+GEOIP_LICENSE = LGPLv2.1+
+GEOIP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.5
