From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 23:29:41 +0200
Subject: [Buildroot] [git commit] mplayer: Amend libmad selection
Message-ID: <20121004213120.10412997AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79f77bf92587878145049a0d6d771dd92ddc1fe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not set both --enable-mad and --disable-mad.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 9ff4b8a..9967dd9 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -81,6 +81,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 MPLAYER_DEPENDENCIES += libmad
+MPLAYER_CONF_OPTS += --enable-mad
 else
 MPLAYER_CONF_OPTS += --disable-mad
 endif
@@ -136,7 +137,6 @@ define MPLAYER_CONFIGURE_CMDS
 		--extra-cflags="$(MPLAYER_CFLAGS)" \
 		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
 		--yasm='' \
-		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
 		--enable-cross-compile \
