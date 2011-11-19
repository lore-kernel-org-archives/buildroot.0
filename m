From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 15:56:48 +0100
Subject: [Buildroot] [git commit] mplayer: external tremor support needs ogg
	as well
Message-ID: <20111119145730.AF0D68F4F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c29fad1e1b6a438b0012bc5703ae044370eb7222
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 2ac5e16..96b4e73 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -67,8 +67,8 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
-ifeq ($(BR2_PACKAGE_TREMOR),y)
-MPLAYER_DEPENDENCIES += tremor
+ifeq ($(BR2_PACKAGE_TREMOR)$(BR2_PACKAGE_LIBOGG),yy)
+MPLAYER_DEPENDENCIES += tremor libogg
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
 endif
 
