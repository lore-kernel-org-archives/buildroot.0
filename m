From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:04:35 +0200
Subject: [Buildroot] [PATCH 2/3] gst-plugins-base: add option to select
	'alsa'
In-Reply-To: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1328918676-19482-3-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's nice to go straight to GStreamer, and enable all the plug-in
elements without having to go back through the menus to select the
dependencies.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 package/multimedia/gst-plugins-base/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 851337b..a1fa0f1 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -94,5 +94,10 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
 	bool "vorbis (*.ogg audio)"
 	select BR2_PACKAGE_LIBVORBIS
 
-endif
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
+	bool "alsa"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_PCM
 
+endif
-- 
1.7.9.1.g97f7d
