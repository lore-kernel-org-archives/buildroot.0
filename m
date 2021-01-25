From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:23:02 +0100
Subject: [Buildroot] [git commit] package/mpd: create directories used in
 mpd.conf
Message-ID: <20210125210322.12C2D836B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0031c5621e302c659bec13dfcc62b55ac288462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13471

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6e8a3f36da..baabb6ff38 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -333,6 +333,8 @@ endif
 
 define MPD_INSTALL_EXTRA_FILES
 	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
