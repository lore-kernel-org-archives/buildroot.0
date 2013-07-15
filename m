From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:43 -0500
Subject: [Buildroot] [PATCH 60/67] gst-plugins-good: libglib2 requires
	threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-61-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst-plugins-good/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 978aa0b..da709db 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -188,8 +188,13 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
+	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
 	select BR2_PACKAGE_GDK_PIXBUF
 
+comment "gdkpixbuf requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
@@ -204,8 +209,13 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
+	depends on BR2_USE_WCHAR # libsoup -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
 	select BR2_PACKAGE_LIBSOUP
 
+comment "souphttsrc requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
-- 
1.8.1.2
