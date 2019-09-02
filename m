From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:09:49 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gst1-rtsp-server:
 disable examples and tests
Message-ID: <20190902150559.DE4778A298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a920265a7cb1e884cb101602d57d94bd7d7635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/7a268af00535d0f93e94955a3beea2745cf93422

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit baa7714664069c319f50314b725a74889e8f527d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index a86b137ce2..a5df7c66bb 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -15,6 +15,9 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	gst1-plugins-good
+GST1_RTSP_SERVER_CONF_OPTS = \
+	--disable-examples \
+	--disable-tests
 
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
