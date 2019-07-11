From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Jul 2019 18:57:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-base: fix build with
 NLS
Message-ID: <20190711165744.8939-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/93b58753071dac193881049c79288ef39fa9db16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 34c6074b8f..66c136c36c 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -26,7 +26,9 @@ GST1_PLUGINS_BASE_CONF_OPTS += \
 	-Dlibvisual=disabled \
 	-Diso-codes=disabled
 
-GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1
+GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1 $(TARGET_NLS_DEPENDENCIES)
+
+GST1_PLUGINS_BASE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 # These plugins are listed in the order from ./configure --help
 ifeq ($(BR2_PACKAGE_ORC),y)
-- 
2.20.1
