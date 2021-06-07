From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:21:09 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/wpewebkit: select
 gstreamer autoaudiosink
Message-ID: <20210607205546.8606D88F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a9c4dc3d4995c4ea195cc68a99f4a96e6b1f645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT when multimedia
support is enabled. This is needed at runtime to automatically select
a suitable audio output element, otherwise WebKit will crash at an
assertion due to the missing "autoaudiosink" element. More here:

  https://wpewebkit.org/about/faq.html#why-does-the-browser%2Flauncher-(e.g.-cog)-crash-when-trying-to-play-audio%3F

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 51484b29cafce569ed1d9822e87de7bc16fb9d2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 640f7c7011..c8c66e8458 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -95,6 +95,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
