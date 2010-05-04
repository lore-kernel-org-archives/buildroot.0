From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 May 2010 21:38:14 +0200
Subject: [Buildroot] [git commit master] mplayer: internal copies of
	libdvdread/libdvdcss require largefile support
Message-ID: <20100504194052.714178D422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=23ff3c278602bc4531bf8d5de179af188837907e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So disable when we don't have largefile support in toolchain.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/multimedia/mplayer/mplayer.mk              |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)
 mode change 100755 => 100644 package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch

diff --git a/CHANGES b/CHANGES
index 21848a6..fa0317c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: xdriver_xf86-video-openchrome
+	Updated/fixed packages: mplayer, xdriver_xf86-video-openchrome
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch b/package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch
old mode 100755
new mode 100644
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 538bac9..50afcfb 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -22,7 +22,10 @@ endif
 ifeq ($(BR2_LARGEFILE),y)
 MPLAYER_LARGEFILE:=--enable-largefiles
 else
-MPLAYER_LARGEFILE:=--disable-largefiles
+# dvdread/dvdcss requires largefile support
+MPLAYER_LARGEFILE:=--disable-largefiles \
+		   --disable-dvdread-internal \
+		   --disable-libdvdcss-internal
 endif
 
 ifeq ($(BR2_i386),y)
-- 
1.6.3.3
