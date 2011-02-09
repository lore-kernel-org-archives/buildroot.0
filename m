From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: fix libao support
Message-ID: <20110209220224.D22818F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b69f7438a8bd142be822630f60b18a6d739a6c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libao output must be explicitly enabled, so fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index c60ccc6..971ad67 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -18,8 +18,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
-else
-MPD_CONF_OPT += --disable-ao
+MPD_CONF_OPT += --enable-ao
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
-- 
1.7.3.4
