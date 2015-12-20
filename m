From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 12:46:12 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: add zbar plugin
Message-ID: <20151220115500.7AD4E81E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5352e7942990ff65037889e2e35d67d7b2671a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add gstreamer zbar plugin.

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index fa2f124..98e5c1c 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -588,4 +588,11 @@ else
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
