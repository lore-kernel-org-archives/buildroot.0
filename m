From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 28 Mar 2009 12:21:33 +0100
Subject: [Buildroot] [PATCH] mplayer: disable LIVE555 Streaming Media
Message-ID: <200903281221.34475.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIVE555 was installed on the build system and was recognized by configure:
Checking for LIVE555 Streaming Media libraries ... yes (using distribution version)

Later this led to a linker error:
ld: cannot find -lliveMedia

Disable LIVE555, since it's not available in Buildroot.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/mplayer/mplayer.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index b65d288..d9aad04 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -63,6 +63,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		--disable-mpdvdkit \
 		--disable-ivtv \
 		--disable-tv \
+		--disable-live \
 		--enable-dynamic-plugins \
 	)
 	touch $@
-- 
1.6.2.1.394.g4643ffd
