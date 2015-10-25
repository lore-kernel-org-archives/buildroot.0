From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:30:34 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: add x265 plugin
Message-ID: <20151025213049.248FF8047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9d1d56426edebec8c751ddc8a5dfbc7dee58f9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |    7 ++++++-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 ++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a28243b..26a963e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -635,7 +635,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_X265
 	help
-	  x265 plugin
+	  x265 encoding plugin
+
+comment "x265 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index fe5f242..1c42a60 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -760,6 +760,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
+GST1_PLUGINS_BAD_DEPENDENCIES += x265
+GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-x265
 endif
