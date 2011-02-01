From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Feb 2011 08:41:01 +0100
Subject: [Buildroot] [git commit master 1/1] make help: document ncurses,
	make V=1 and make O=<dir>
Message-ID: <20110201074141.30A238E5F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=15f5bef0532aebe2f955cc9b377bd81f8dc06c4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 04783f2..3ecc597 100644
--- a/Makefile
+++ b/Makefile
@@ -655,6 +655,7 @@ help:
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
+	@echo '  nconfig                - interactive ncurses-based configurator'
 	@echo '  xconfig                - interactive Qt-based configurator'
 	@echo '  gconfig                - interactive GTK-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
@@ -673,6 +674,9 @@ help:
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo
+	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
+	@echo '  make O=dir             - Locate all output files in "dir", including .config'
+	@echo
 	@$(foreach b, $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig)), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
-- 
1.7.3.4
