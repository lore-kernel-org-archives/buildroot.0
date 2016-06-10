From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 10 Jun 2016 11:34:38 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-good: cleanup of configure options
Message-ID: <1465551278-19411-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

taglib support has been added in 8299f30a, but the '--disable-taglib'
option has not been removed from conf opts at the top of the .mk file

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 6dc322b..8d7ff29 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -30,8 +30,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-jack \
 	--disable-libdv \
 	--disable-dv1394 \
-	--disable-shout2 \
-	--disable-taglib
+	--disable-shout2
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
-- 
2.8.2
