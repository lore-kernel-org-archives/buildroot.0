From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:00 +0200
Subject: [Buildroot] [git commit] ncurses: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.6A44C81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99212c73ace9365fbf71396dec717d65852ca12d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2764824..9555f1e 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -127,9 +127,9 @@ endif
 # ncurses breaks with parallel build, but takes quite a while to
 # build single threaded. Work around it similar to how Gentoo does
 define NCURSES_BUILD_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
 	rm -rf $(@D)/misc/pc-files
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
 ifneq ($(BR2_STATIC_LIBS),y)
