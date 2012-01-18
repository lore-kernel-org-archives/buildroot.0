From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:56 +0100
Subject: [Buildroot] [git commit] ncurses: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150408.2B4D59036E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79f7d48fb7440a2dbb54e90a0090243ff5173313
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index a1353ed..eb8a043 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -130,6 +130,8 @@ define HOST_NCURSES_BUILD_CMDS
 	$(MAKE) -C $(@D)/progs tic
 endef
 
+HOST_NCURSES_DEPENDENCIES =
+
 HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm
 
