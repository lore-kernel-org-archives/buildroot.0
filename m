From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Sep 2013 23:46:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/mpd: fix files path after
	package/{multimedia => } move
In-Reply-To: <1378763205-6180-1-git-send-email-yann.morin.1998@free.fr>
References: <1378763205-6180-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1378763205-6180-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Cset adf6511 moved packages from package/multimedia/ to package/
but forgot to change the paths of files referenced in the .mk files.

Fix mpd's config file and startup script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.8.1.2
