From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Sep 2013 22:40:50 +0200
Subject: [Buildroot] [git commit] mpd: remove reference to old multimedia
	sub-directory
Message-ID: <20130909204102.B3BB48349A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34406e2bee51f51e582fc350781561ae42a3e260
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpd/mpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index edcd945..737be41 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -129,10 +129,10 @@ endif
 
 define MPD_INSTALL_EXTRA_FILES
 	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
-		$(INSTALL) -D package/multimedia/mpd/mpd.conf \
+		$(INSTALL) -D package/mpd/mpd.conf \
 			$(TARGET_DIR)/etc/mpd.conf; \
 	fi
-	$(INSTALL) -m 0755 -D package/multimedia/mpd/S95mpd \
+	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
 		$(TARGET_DIR)/etc/init.d/S95mpd
 endef
 
