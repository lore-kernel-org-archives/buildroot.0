From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon,  9 Sep 2013 22:23:24 +0200
Subject: [Buildroot] [PATCH 1/1] mpd : remove reference to old multimedia
	sub-directory
Message-ID: <1378758204-15272-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/mpd/mpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.8.3.2
