From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:07:12 +0100
Subject: [Buildroot] [git commit] mpd: use <pkg>_INSTALL_INIT_SYSV mechanism
Message-ID: <20141201221141.23AA58002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acb268f78f81f7ecab00e9d335075925d4efd40c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
