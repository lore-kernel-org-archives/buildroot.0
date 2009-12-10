From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Dec 2009 00:32:35 +0100
Subject: [Buildroot] [git commit master] Fix gst-plugins-bad dependency on
 openssl through the apexsink element Signed-off-by: Lionel Landwerlin
 <llandwerlin@gmail.com> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Message-ID: <20091210233612.67502777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7e5804ab105e1227d2a051f43947c99d86d5d10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 6c5e448..180facf 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -24,6 +24,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
 	bool "asfmux"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "apexsink"
+	select BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index ee7003c..9b65198 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -39,6 +39,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
-- 
1.6.3.3
