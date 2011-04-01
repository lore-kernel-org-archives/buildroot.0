From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Apr 2011 21:56:21 +0200
Subject: [Buildroot] [git commit master 1/1] mpd: bump to version 0.16.2 and
	bugfix
Message-ID: <20110401195641.4EF2581D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=887d210986da45191dcb14647b93fea20b5ddb3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump mpd server to version 0.6.12
Also make ffmpeg support conditional on IPv6 since the new ffmpeg
version requires it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
