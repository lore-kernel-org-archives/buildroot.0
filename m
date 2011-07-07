From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  7 Jul 2011 09:39:07 +0200
Subject: [Buildroot] [PATCH 8/9] gst-plugins-good: add optional dependency
	on orc
In-Reply-To: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310024348-3575-9-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../gst-plugins-good/gst-plugins-good.mk           |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 8fbd120..afde749 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -26,6 +26,10 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_GOOD_DEPENDENCIES += orc
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
 GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-- 
1.7.1
