From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Sep 2011 23:25:55 +0200
Subject: [Buildroot] [git commit] ncurses: fix host build breakage
Message-ID: <20110927212738.4483B8D9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57194c2bd87045def1a01335336feb0d71715c91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable GPM support for host ncurses build since it sometimes breaks the
build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
