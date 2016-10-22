From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ncurses: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132036.CBABA819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7bb73d0fb9c30e84f973234c4bccacf4bea6b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9555f1e..343909f 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -169,8 +169,8 @@ endef # NCURSES_INSTALL_TARGET_CMDS
 # ourselves, and use that during installation.
 #
 define HOST_NCURSES_BUILD_CMDS
-	$(MAKE1) -C $(@D) sources
-	$(MAKE) -C $(@D)/progs tic
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) sources
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/progs tic
 endef
 
 HOST_NCURSES_CONF_OPTS = \
