From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 10 Feb 2011 17:47:15 +0100
Subject: [Buildroot] [PATCH] mplayer: bump version to fix build error
Message-ID: <1297356435-11303-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.1
