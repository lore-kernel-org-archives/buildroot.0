From: Viacheslav Volkov <sv99@inbox.ru>
Date: Tue, 27 Oct 2015 12:25:10 +0300
Subject: [Buildroot] [PATCH 2/2] gst-plugins-bad: add zbar plugin
In-Reply-To: <1445937910-26996-1-git-send-email-sv99@inbox.ru>
References: <1445937910-26996-1-git-send-email-sv99@inbox.ru>
Message-ID: <1445937910-26996-2-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 package/gstreamer/gst-plugins-bad/Config.in          | 4 ++++
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 6aa93de..3bfd12b 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -319,4 +319,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 	bool "vp8"
 	select BR2_PACKAGE_LIBVPX
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
+	bool "zbar"
+	select BR2_PACKAGE_ZBAR
+
 endif
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 0a85603..1c80593 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -585,4 +585,11 @@ else
 GST_PLUGINS_BAD_CONF_OPTS += --disable-vp8
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR),y)
+GST_PLUGINS_BAD_CONF_OPTS += --enable-zbar
+GST_PLUGINS_BAD_DEPENDENCIES += zbar
+else
+GST_PLUGINS_BAD_CONF_OPTS += --disable-zbar
+endif
+
 $(eval $(autotools-package))
-- 
2.6.1
