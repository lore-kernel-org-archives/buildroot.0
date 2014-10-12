From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Oct 2014 12:22:04 +0200
Subject: [Buildroot] [PATCH v2] Makefile: make help: remove <package>- help,
	add link to online manual
In-Reply-To: <1413109039-23845-1-git-send-email-arnout@mind.be>
References: <1413109039-23845-1-git-send-email-arnout@mind.be>
Message-ID: <1413109324-24401-1-git-send-email-arnout@mind.be>
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
v2: move the link to the online manual to the bottom.

At the BR developer meeting we decided to go for this option.

A TODO item has been added to create a 'make <package>-help' target
that shows all the package-specific targets.

Perhaps something similar should be done for the defconfigs and
for the allyesconfig etc. targets as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3f56648..c0dcec8 100644
--- a/Makefile
+++ b/Makefile
@@ -843,9 +843,6 @@ help:
 	@echo 'Build:'
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
-	@echo '  <package>-rebuild      - force recompile <package>'
-	@echo '  <package>-reconfigure  - force reconfigure <package>'
-	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
@@ -908,7 +905,8 @@ ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-	@echo 'See docs/README, or generate the Buildroot manual for further details'
+	@echo 'For further details, see README, generate the Buildroot manual, or consult'
+	@echo 'it on-line at http://buildroot.org/docs.html'
 	@echo
 
 release: OUT = buildroot-$(BR2_VERSION)
-- 
2.1.1
