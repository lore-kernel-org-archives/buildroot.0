From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 May 2012 07:33:36 -0300
Subject: [Buildroot] [PATCH 1/2] ncurses: install screen terminfo file
Message-ID: <1336386817-29877-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install the terminfo file for screen as reported on bug #5204

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/ncurses.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index eb8a043..10a55dd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -117,6 +117,8 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
+	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
 	$(NCURSES_INSTALL_TARGET_DEVFILES)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
-- 
1.7.3.4
