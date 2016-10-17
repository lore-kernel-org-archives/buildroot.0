From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:57 -0300
Subject: [Buildroot] [PATCH 10/93] ncurses: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-11-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
