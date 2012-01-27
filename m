From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Jan 2012 11:18:52 +0100
Subject: [Buildroot] [git commit] mplayer: add optional vorbis dependency
Message-ID: <20120127102425.5BE4F90918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5796753b6b4caba703cf23f45f68b7715d1150a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 2ac5e16..216bb46 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -72,6 +72,11 @@ MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+MPLAYER_DEPENDENCIES += libvorbis
+MPLAYER_CONF_OPTS += --enable-libvorbis
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 MPLAYER_DEPENDENCIES += libmad
 else
