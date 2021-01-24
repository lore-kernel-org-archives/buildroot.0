From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jan 2021 19:26:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpd: create directories used in
 mpd.conf
Message-ID: <20210124182605.1044277-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13471

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5cdcc2c009..919673cad4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -350,6 +350,8 @@ endif
 
 define MPD_INSTALL_EXTRA_FILES
 	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
-- 
2.29.2
