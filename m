From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:06:11 +0200
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1/gst1-plugins-good: add twolame plugin
Message-ID: <20190526191650.F28718157D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e11760c82cea915e895752ee5262031e65899ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This plugin was introduced in 1.16.0. It depends on the twolame
package and allows a user to encode MP2s with TwoLAME.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
