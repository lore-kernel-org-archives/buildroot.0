From: Valentine Barshak <gvaxon@gmail.com>
Date: Fri, 28 Sep 2012 23:19:25 +0400
Subject: [Buildroot] [PATCH 1/2] mplayer: Amend libmad selection
In-Reply-To: <20120928191730.GA9550@gmail.com>
Message-ID: <20120928191925.GA9852@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not set both --enable-mad and --disable-mad.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/multimedia/mplayer/mplayer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 05120bf..788beeb 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -66,6 +66,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 MPLAYER_DEPENDENCIES += libmad
+MPLAYER_CONF_OPTS += --enable-mad
 else
 MPLAYER_CONF_OPTS += --disable-mad
 endif
@@ -121,7 +122,6 @@ define MPLAYER_CONFIGURE_CMDS
 		--extra-cflags="$(MPLAYER_CFLAGS)" \
 		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
 		--yasm='' \
-		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
 		--enable-cross-compile \
-- 
1.7.11.4
