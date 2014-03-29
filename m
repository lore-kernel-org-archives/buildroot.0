From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:29:48 +0100
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: transponders
	data now provided by dtv-scan-tables
Message-ID: <20140329173147.642119C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bf6f370200dfdaf00aa6980a344392cc832d189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |    2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 2c5c290..deffabe 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -481,7 +481,7 @@ comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
-	select BR2_PACKAGE_DVB_APPS
+	select BR2_PACKAGE_DTV_SCAN_TABLES
 	help
 	  DVB elements
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index dbd0625..f66c250 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -683,7 +683,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-dvb
-GST1_PLUGINS_BAD_DEPENDENCIES += dvb-apps
+GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
 else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-dvb
 endif
