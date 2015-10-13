From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 14 Oct 2015 00:06:27 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-base: update configure options
Message-ID: <1444773987-19382-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add new gio_unix_2_0 option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - change gio_unix_2_0 from disabled to option (needed library
    already provided by libglib2 package) (suggested by Thomas Petazzoni)
---
 package/gstreamer1/gst1-plugins-base/Config.in            | 5 +++++
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 44367eb..d91f56e 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -150,4 +150,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS
 	help
 	  Vorbis plugin library
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_UNIX_2_0
+	bool "gio-unix-2.0"
+	help
+	  glib GIO unix plugin
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 08ebe03..f391530 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -202,4 +202,10 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_UNIX_2_0),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-gio_unix_2_0
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio_unix_2_0
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
