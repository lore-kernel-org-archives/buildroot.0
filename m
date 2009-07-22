From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 22 Jul 2009 22:16:07 +0200
Subject: [Buildroot] [git commit] gst-plugins-good: disable aalib
Message-ID: <20090722204048.5348A7781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3e6a0a80d21aa737fdab674fc9361630ed9a6cf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explictly disable the build of the aasink plug-in. Without this fix
the plug-in would be built if the aalib headers are found on the host.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
