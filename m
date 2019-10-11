From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:40:54 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-rtsp-server:
 convert package type to meson
Message-ID: <20191011224157.35D088D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e91b127bcdf00ef05974a2e0065ce6410a33e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Arnout: rebase with disabled examples and tests]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index c84d0c7e16..476aa55cb5 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -15,9 +15,20 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	gst1-plugins-good
+
+GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 GST1_RTSP_SERVER_CONF_OPTS = \
-	--disable-examples \
-	--disable-tests
+	-Dexamples=disabled \
+	-Dtests=disabled
+
+GST1_RTSP_SERVER_CONF_OPTS += \
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled \
+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled
 
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
@@ -27,4 +38,4 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
