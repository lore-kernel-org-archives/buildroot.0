From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 14:37:34 +0100
Subject: [Buildroot] [git commit] mplayer: tremor now automatically pulls in
	libogg
Message-ID: <20120125140244.1479E9056F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0327c24e5f14e7d8eb000d74b0c6bf29c0ed92a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So no need to explicitly depend on it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 96b4e73..2ac5e16 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -67,8 +67,8 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
-ifeq ($(BR2_PACKAGE_TREMOR)$(BR2_PACKAGE_LIBOGG),yy)
-MPLAYER_DEPENDENCIES += tremor libogg
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
 endif
 
