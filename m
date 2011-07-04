From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:44 +0200
Subject: [Buildroot] [PATCH 5/6] gst-plugins-base: depend on orc if it is
	enabled
In-Reply-To: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 79ced30..74e0622 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -12,7 +12,7 @@ GST_PLUGINS_BASE_INSTALL_STAGING = YES
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
 GST_PLUGINS_BASE_CONF_ENV =
-		FT2_CONFIG=/bin/false \
+		FT2_CONFIG=/bin/ilfalse \
 		ac_cv_header_stdint_t="stdint.h"
 
 GST_PLUGINS_BASE_CONF_OPT = \
@@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_FFMPEG_DEPENDENCIES += orc
+endif
+
 # alsa support needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
-- 
1.7.1
