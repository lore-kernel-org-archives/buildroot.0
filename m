From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 16:17:23 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-base: disable parallel build
In-Reply-To: <1317392243-27154-1-git-send-email-s.neumann@raumfeld.com>
References: <1317392243-27154-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317392243-27154-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallel builds sometimes break when audio/testchannels is
compiled before the gstinterfaces library.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 3b21c27..78144d9 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -8,6 +8,8 @@ GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 
+GST_PLUGINS_BASE_MAKE = $(MAKE1)
+
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
-- 
1.7.4.1
