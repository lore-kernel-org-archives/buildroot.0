From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 22 Feb 2013 23:04:03 -0800
Subject: [Buildroot] [PATCH] gstreamer: ALSA plugin requires threads support
In-Reply-To: <y>
References: <y>
Message-ID: <1361603043-22539-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/2782b5ee6af25da9d49d9bc7b950dc2a92fb5bca

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/multimedia/gst-plugins-base/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index af4fe8c..766a9ea 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -78,6 +78,10 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_ALSA_LIB_PCM
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+
+comment "alsa support requires a toolchain with threads support enabled"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 	bool "ogg (*.ogg audio/video)"
-- 
1.7.10.4
