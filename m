From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 19:21:05 +0100
Subject: [Buildroot] [git commit] opencv: add missing indirect dependency
	from gstreamer
Message-ID: <20140220194901.5D9379CAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b536ee6069c638cabbe4c3309b8fea52682222e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
