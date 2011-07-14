From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 09:32:40 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-base: depend on orc if it is
	enabled
In-Reply-To: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310628760-4172-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 79ced30..09e0729 100644
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
-- 
1.7.1
