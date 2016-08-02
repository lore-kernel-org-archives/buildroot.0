From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:15:41 +0200
Subject: [Buildroot] [git commit] ncurses: install PuTTY terminfo files
Message-ID: <20160802203454.13CFB820F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ae057d0a8b43556bbc5e2e021c519f5d32e4e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Glessner <david.glessner@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index bef57c5..55e5c81 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -96,6 +96,7 @@ NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
 NCURSES_CONF_OPTS += --enable-ext-colors
 NCURSES_ABI_VERSION = 6
 define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty-256color $(TARGET_DIR)/usr/share/terminfo/p
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm+256color $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-256color $(TARGET_DIR)/usr/share/terminfo/x
 endef
@@ -148,9 +149,9 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
-	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100-putty $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt200 $(TARGET_DIR)/usr/share/terminfo/v
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt220 $(TARGET_DIR)/usr/share/terminfo/v
@@ -158,8 +159,12 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
+	mkdir -p $(TARGET_DIR)/usr/share/terminfo/p
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty $(TARGET_DIR)/usr/share/terminfo/p
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/p/putty-vt100 $(TARGET_DIR)/usr/share/terminfo/p
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
+	$(NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
 #
