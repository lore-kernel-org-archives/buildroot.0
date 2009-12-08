From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 8 Dec 2009 21:43:53 +0100
Subject: [Buildroot] [git commit master] gst-plugins-bad: make more
	dependency-less plugins configurable
Message-ID: <20091208204425.DB0DD77783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a5992b7f173fd78f035c0f416c95f0fe61552e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest update added a few new plugins that were missing from
the buildroot configuration system. This commit makes these
dependency-less plugins configurable.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 +-
 package/multimedia/gst-plugins-bad/Config.in       |   12 ++++++++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |   24 ++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45697f3..816b26d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,8 @@
 	New packages: tcpreplay, hostapd
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, iw, libfuse, libpcap, lighttpd, mesa, pcre, sshfs,
-	usbutils
+	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
+	mesa, pcre, sshfs, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 8601cf4..c7ebe2a 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE
 	bool "amrparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
+	bool "asfmux"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
@@ -54,9 +57,15 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
 	bool "freeze"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
+	bool "frei0r"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE
 	bool "h264parse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE
+	bool "hdvparse"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
 	bool "librfb"
 
@@ -114,6 +123,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR
 	bool "selector"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE
+	bool "shapewipe"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
 	bool "siren"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index c6c5fd0..9a0955f 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -33,6 +33,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-amrparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-asfmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
@@ -99,12 +105,24 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-frei0r
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-frei0r
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-h264parse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-h264parse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-hdvparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
 else
@@ -219,6 +237,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-selector
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-shapewipe
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-shapewipe
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-siren
 else
-- 
1.6.3.3
