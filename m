From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 21:41:57 +0200
Subject: [Buildroot] [PATCH v3 1/2] gst1-plugins-base: update configure
	options
Message-ID: <1444938117-6405-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- always disable new gio_unix_2_0 option (only used for testing)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - always disable gio_unix_2_0 option (suggested by Thomas Petazzoni)

Changes v1 -> v2:
  - change gio_unix_2_0 from disabled to option (needed library
    already provided by libglib2 package) (suggested by Thomas Petazzoni)
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 08ebe03..099fb2a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -22,6 +22,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
 	--disable-oggtest \
 	--disable-vorbistest \
+	--disable-gio_unix_2_0 \
 	--disable-freetypetest \
 	--disable-valgrind
 
-- 
2.1.4
