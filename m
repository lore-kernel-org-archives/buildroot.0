From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  9 May 2019 18:46:19 -0400
Subject: [Buildroot] [PATCH 1/5] package/gstreamer1/gst1-plugins-good: Add
 twolame plugin
In-Reply-To: <20190509224624.80437-1-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
Message-ID: <20190509224624.80437-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This plugin was introduced in 1.16.0. It dependends on the twolame package
and allows a user to encode MP2s with TwoLAME

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 6 ++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 30a4876ee7..3af05ba6b4 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -389,6 +389,12 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB
 comment "taglib needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME
+	bool "twolame"
+	select BR2_PACKAGE_TWOLAME
+	help
+	  twolame mp2 audio encoder plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 4ef128229a..462d5e1307 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -429,6 +429,13 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-taglib
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-twolame
+GST1_PLUGINS_GOOD_DEPENDENCIES += twolame
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-twolame
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-vpx
 GST1_PLUGINS_GOOD_DEPENDENCIES += libvpx
-- 
2.21.0
