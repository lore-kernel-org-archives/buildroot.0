From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:48 -0300
Subject: [Buildroot] [PATCH 1/2] ncurses: fix host build breakage
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable GPM support for host ncurses build since it sometimes breaks the
build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/ncurses.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ac4c12b..8c8ae36 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -131,7 +131,7 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPT = \
-	--without-shared
+	--without-shared --without-gpm
 
 $(eval $(call AUTOTARGETS,package,ncurses))
 $(eval $(call AUTOTARGETS,package,ncurses,host))
-- 
1.7.3.4
