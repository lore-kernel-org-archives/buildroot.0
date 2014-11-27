From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:31 +0100
Subject: [Buildroot] [PATCHv2 73/74] mpd: install configuration file
	unconditionally
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-74-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b44285b..5176dc4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -228,10 +228,7 @@ MPD_CONF_OPTS += --disable-wavpack
 endif
 
 define MPD_INSTALL_EXTRA_FILES
-	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
-		$(INSTALL) -D package/mpd/mpd.conf \
-			$(TARGET_DIR)/etc/mpd.conf; \
-	fi
+	$(INSTALL) -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
-- 
2.1.0
