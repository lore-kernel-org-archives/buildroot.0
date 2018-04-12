From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 22:45:42 +0200
Subject: [Buildroot] [PATCH v4 10/11] gst1-plugins-base: remove never set
 BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND
In-Reply-To: <20180412204543.25535-1-ps.report@gmx.net>
References: <20180412204543.25535-1-ps.report@gmx.net>
Message-ID: <20180412204543.25535-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 71ea964e09..0edc757484 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -68,7 +68,7 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-x11
 endif
 
-ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND),)
+ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND),)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-wayland
 GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
 else
-- 
2.16.3
