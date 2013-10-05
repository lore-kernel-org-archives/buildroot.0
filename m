From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:02:48 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: ensure bluetooth support
	is picked up if enabled
Message-ID: <20131005190419.B13209B8E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d850348c547aaf7b2fc5548e4b2bff43f78e7b61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index fdc17eb..e3f3bf3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -90,6 +90,13 @@ GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPT += --enable-orc
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += bluez_utils
+GST1_PLUGINS_BAD_CONF_OPT += --enable-bluez
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-bluez
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-accurip
 else
