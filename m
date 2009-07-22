From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 22 Jul 2009 12:33:46 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: disable aalib
Message-ID: <1248258826-11513-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explictly disable the build of the aasink plug-in. Without this fix
the plug-in would be built if the aalib headers are found on the host.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 75d25c8..bd0cb78 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -20,11 +20,12 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-x \
 		--disable-xshm \
 		--disable-xvideo \
+		--disable-aalib \
 		--disable-aalibtest \
+		--disable-esd \
 		--disable-esdtest \
 		--disable-shout2 \
-		--disable-shout2test \
-		--disable-esd 
+		--disable-shout2test
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
-- 
1.6.0.4
