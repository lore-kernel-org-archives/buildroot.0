From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 19:39:38 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/mpd: create
 directories used in mpd.conf
Message-ID: <20210128200058.6199B812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd1c3b4801e3a0a0b5a5854a6f428f73b5ae5e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13471

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0031c5621e302c659bec13dfcc62b55ac288462)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a5825fffe0..8950909aaa 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -333,6 +333,8 @@ endif
 
 define MPD_INSTALL_EXTRA_FILES
 	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
+	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
