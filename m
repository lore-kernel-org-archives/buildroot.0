From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:37:56 +0200
Subject: [Buildroot] [git commit] Makefile: make help: remove <package>-
	help, add link to online manual
Message-ID: <20141012104112.AD708B23A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61446d3d154478ca01b1ccb57bf9a6e8ff60b7ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only documented a few of the <package>- targets and it's hard to
decide which ones are relevant for make help. Since the help is already
way too long, it's better to remove these advanced targets.

Instead, let's refer to the online manual.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9a6ff15..907a0fc 100644
--- a/Makefile
+++ b/Makefile
@@ -847,9 +847,6 @@ help:
 	@echo 'Build:'
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
-	@echo '  <package>-rebuild      - force recompile <package>'
-	@echo '  <package>-reconfigure  - force reconfigure <package>'
-	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
@@ -912,7 +909,8 @@ ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-	@echo 'See docs/README, or generate the Buildroot manual for further details'
+	@echo 'For further details, see README, generate the Buildroot manual, or consult'
+	@echo 'it on-line at http://buildroot.org/docs.html'
 	@echo
 
 release: OUT = buildroot-$(BR2_VERSION)
