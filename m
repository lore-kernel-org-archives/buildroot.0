From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Oct 2014 12:17:19 +0200
Subject: [Buildroot] [PATCH] Makefile: make help: remove <package>- help,
	add link to online manual
Message-ID: <1413109039-23845-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only documented a few of the <package>- targets and it's hard to
decide which ones are relevant for make help. Since the help is already
way too long, it's better to remove these advanced targets.

Instead, let's refer to the online manual.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
At the BR developer meeting we decided to go for this option.

A TODO item has been added to create a 'make <package>-help' target
that shows all the package-specific targets.

Perhaps something similar should be done for the defconfigs and
for the allyesconfig etc. targets as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 3f56648..d6fb69f 100644
--- a/Makefile
+++ b/Makefile
@@ -836,6 +836,7 @@ endif
 	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
 help:
+	@echo 'For full, details, refer to the manual at http://buildroot.org/docs.html'
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
@@ -843,9 +844,6 @@ help:
 	@echo 'Build:'
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
-	@echo '  <package>-rebuild      - force recompile <package>'
-	@echo '  <package>-reconfigure  - force reconfigure <package>'
-	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
-- 
2.1.1
