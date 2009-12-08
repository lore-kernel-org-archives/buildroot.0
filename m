From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Dec 2009 21:50:29 +0100
Subject: [Buildroot] [git commit master] gst-plugins-bad: allow the build of
	ivorbisdec plugin
Message-ID: <20091208205422.D0D02777B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=63dd44dbcdc6eb8d8299f72993449a1cca3ad2e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to select the ivorbisdec plugin using the tremor
fixed-point Ogg Vorbis decoder.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 3 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 816b26d..80005c2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
-	mesa, pcre, sshfs, usbutils
+	mesa, pcre, sshfs, tremor, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index c7ebe2a..66335a8 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -176,6 +176,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_TREMOR
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 9a0955f..bd5b633 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -336,6 +336,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-ivorbis
+GST_PLUGINS_BAD_DEPENDENCIES += tremor
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-ivorbis
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
 else
-- 
1.6.3.3
