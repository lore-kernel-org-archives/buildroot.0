From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 Feb 2012 18:00:34 +0100
Subject: [Buildroot] [git commit] gst-plugins-base: add missing orc
	dependency
Message-ID: <20120211170149.D407690A67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94f70d581073822012d4124b5076b172098d40c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 87ee80d..3b21c27 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_BASE_DEPENDENCIES += orc
+endif
+
 # alsa support needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
