From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Sat, 24 Oct 2015 21:50:29 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: add x265 plugin
In-Reply-To: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
Message-ID: <1445716229-40660-2-git-send-email-thijsvermeir@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 7 ++++++-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

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
-- 
2.1.0
