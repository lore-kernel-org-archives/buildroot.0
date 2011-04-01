From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Apr 2011 15:51:28 -0300
Subject: [Buildroot] [PATCH 1/2] mpd: bump to version 0.16.2 and bugfix
Message-ID: <1301683889-30169-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump mpd server to version 0.6.12
Also make ffmpeg support conditional on IPv6 since the new ffmpeg
version requires it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/Config.in |    4 ++--
 package/multimedia/mpd/mpd.mk    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index b3491f2..a6ded13 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -64,8 +64,8 @@ config BR2_PACKAGE_MPD_FFMPEG
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by ffmpeg.
 
-comment "ffmpeg support requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index d6658ae..3f5057c 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.1
+MPD_VERSION = 0.16.2
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
-- 
1.7.3.4
