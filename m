From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] mplayer: bump version to fix
	build error
Message-ID: <20110210202907.D0E628F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d60a445996603911b10f62f715e773b20d34ee6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump mplayer to the first version that fixes this issue:

file.c:23:5: warning: "HAVE_MMAP" is not defined
file.c:25:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
file.c:77:5: warning: "HAVE_MMAP" is not defined
file.c:87:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
file.c:124:5: warning: "HAVE_MMAP" is not defined
file.c:126:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
file.c: In function 'av_file_map':
file.c:50: error: 'HAVE_MMAP' undeclared (first use in this function)
file.c:50: error: (Each undeclared identifier is reported only once
file.c:50: error: for each function it appears in.)
make[2]: *** [file.o] Error 1

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index bd5c079..7d45960 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -3,7 +3,7 @@
 # mplayer
 #
 #############################################################
-MPLAYER_VERSION = 32710
+MPLAYER_VERSION = 32726
 # MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.bz2
 # MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 MPLAYER_SITE = svn://svn.mplayerhq.hu/mplayer/trunk
-- 
1.7.3.4
