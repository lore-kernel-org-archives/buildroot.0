From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Feb 2011 21:27:40 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: forcibly disable oggflac
	without flac
Message-ID: <20110225202931.19C588F780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=53725fafee39cad72f586f7306acc25afaecbbc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If flac and libogg were both built but flac isn't selected in mpd it
will be picked up anyway.
Forcibly disable oggflac support if flac support is disabled for
consistency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 3653152..d6658ae 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -35,7 +35,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
 else
-MPD_CONF_OPT += --without-flac
+MPD_CONF_OPT += --without-flac --disable-oggflac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
-- 
1.7.3.4
