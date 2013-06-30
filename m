From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 13:50:36 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: libdvdread needs
	largefile support
Message-ID: <20130630122922.1321990AF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27215647240731757342930bb177461438b06c53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst1-plugins-ugly/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst1-plugins-ugly/Config.in b/package/multimedia/gst1-plugins-ugly/Config.in
index a6ca387..0fb3e92 100644
--- a/package/multimedia/gst1-plugins-ugly/Config.in
+++ b/package/multimedia/gst1-plugins-ugly/Config.in
@@ -41,10 +41,14 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
+	depends on BR2_LARGEFILE # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
+comment "dvdread requires a toolchain with largefile support"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
 	select BR2_PACKAGE_LAME
