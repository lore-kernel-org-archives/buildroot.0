From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.16.3
Message-ID: <20110912052630.2FDA68D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f5a613eef9214da8e5c90492f8428b7c6696b29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../mpd/mpd-0.16.2-tremor-needs-ogg_common.patch   |   20 --------------------
 package/multimedia/mpd/mpd.mk                      |    2 +-
 2 files changed, 1 insertions(+), 21 deletions(-)
 delete mode 100644 package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch

diff --git a/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch b/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch
deleted file mode 100644
index d315f14..0000000
--- a/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-[PATCH] configure: tremor needs common ogg support just like libvorbis does
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: mpd-0.16.2/configure.ac
-===================================================================
---- mpd-0.16.2.orig/configure.ac
-+++ mpd-0.16.2/configure.ac
-@@ -1081,7 +1081,7 @@
- fi
- 
- AM_CONDITIONAL(HAVE_OGG_COMMON,
--	  test x$enable_vorbis = xyes || test x$enable_oggflac = xyes || test x$enable_flac = xyes)
-+	  test x$enable_vorbis = xyes || test x$enable_tremor = xyes || test x$enable_oggflac = xyes || test x$enable_flac = xyes)
- 
- AM_CONDITIONAL(HAVE_FLAC_COMMON,
- 	  test x$enable_flac = xyes || test x$enable_oggflac = xyes)
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index d418f61..e647b4a 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.2
+MPD_VERSION = 0.16.3
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
 MPD_AUTORECONF = YES
 MPD_DEPENDENCIES = host-pkg-config libglib2
-- 
1.7.3.4
