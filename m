From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:07:50 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 proxy plugin option
Message-ID: <20190602201236.27B768EDF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a94d906cf4cc4aae9fef3c0251e1e8087fe1821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This plugin was introduced in 1.16.0. It is dependencyless and
provides proxied inter-pipeline communication.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e0757e96c9..c53ff66272 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -212,6 +212,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM
 	help
 	  PNM plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PROXY
+	bool "proxy"
+	help
+	  Proxy plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
 	bool "rawparse"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a66d3e32bf..d6414f9daa 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -344,6 +344,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PROXY),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-proxy
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-proxy
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
 else
