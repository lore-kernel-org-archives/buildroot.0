From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:04 +0100
Subject: [Buildroot] [RFC v2 04/31] doom-wad: warn that legal-info is not
	implemented
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/games/doom-wad/doom-wads.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/games/doom-wad/doom-wads.mk b/package/games/doom-wad/doom-wads.mk
index bae2420..832d861 100644
--- a/package/games/doom-wad/doom-wads.mk
+++ b/package/games/doom-wad/doom-wads.mk
@@ -23,6 +23,10 @@ $(DOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(DOOM_WAD_SOURCE)
 $(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(DOOM_WAD_DIR)/.unpacked
 	$(INSTALL) -D $(DOOM_WAD_DIR)/doom-$(DOOM_WAD_VERSION).wad $@
 
+doom-wad-legal-info:
+	@echo WARNING: Cannot produce any legal info for package doom-wad \
+		>>$(LEGAL_WARNINGS)
+
 doom-wad: $(TARGET_DIR)/usr/share/games/doom/doom1.wad
 
 #############################################################
-- 
1.7.5.4
