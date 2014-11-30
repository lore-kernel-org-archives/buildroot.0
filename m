From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:15 +0100
Subject: [Buildroot] [PATCHv3 27/74] mpd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-28-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5448251..1eedcbc 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -232,10 +232,13 @@ define MPD_INSTALL_EXTRA_FILES
 		$(INSTALL) -D package/mpd/mpd.conf \
 			$(TARGET_DIR)/etc/mpd.conf; \
 	fi
-	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
-		$(TARGET_DIR)/etc/init.d/S95mpd
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
 
+define MPD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/mpd/S95mpd \
+		$(TARGET_DIR)/etc/init.d/S95mpd
+endef
+
 $(eval $(autotools-package))
-- 
2.1.0
