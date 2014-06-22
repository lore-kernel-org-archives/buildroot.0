From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 20:35:49 +0200
Subject: [Buildroot] [git commit] geoip: new package
Message-ID: <20140622183610.C37809D05C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11fda42896f532a2d28070faa5c3c7ac4ccfb853
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: slightly reformat the Config.in help text. Add the 'LICENSE'
file to GEOIP_LICENSE_FILES.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/geoip/Config.in |   14 ++++++++++++++
 package/geoip/geoip.mk  |   15 +++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1264053..4718719 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -720,6 +720,7 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
+	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
diff --git a/package/geoip/Config.in b/package/geoip/Config.in
new file mode 100644
index 0000000..739a8da
--- /dev/null
+++ b/package/geoip/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GEOIP
+	bool "geoip"
+	help
+	  GeoIP is a C library that enables the user to find
+	  geographical and network information of an IP address.
+
+	  To use this library, you need to download MaxMind's free
+	  GeoLite or commercial GeoIP binary databases into the
+	  target's /usr/share/GeoIP directory in uncompressed form.
+
+	  Note that GeoIP2 / GeoLite2 are not supported by this
+	  library.
+
+	  https://github.com/maxmind/geoip-api-c
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
new file mode 100644
index 0000000..bbfa014
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
+GEOIP_LICENSE_FILES = LICENSE COPYING
+
+$(eval $(autotools-package))
