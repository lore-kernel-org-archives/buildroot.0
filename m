From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Feb 2014 14:34:12 +0100
Subject: [Buildroot] [PATCH 3/3] opencv: add missing indirect dependency
	from gstreamer
In-Reply-To: <1392903252-10253-1-git-send-email-arnout@mind.be>
References: <1392903252-10253-1-git-send-email-arnout@mind.be>
Message-ID: <1392903252-10253-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 217243d..9e952ca 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -134,6 +134,7 @@ comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
+	depends on BR2_USE_MMU # gstreamer -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
 	select BR2_PACKAGE_GSTREAMER
@@ -141,6 +142,7 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
 comment "gstreamer support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
-- 
1.9.rc1
