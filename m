From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Jul 2011 22:19:19 +0200
Subject: [Buildroot] [git commit] make help: sort defconfigs for make 3.82
Message-ID: <20110717201957.EAE808A6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b979619973dad84c2ef6a978b3a3b04b35d6ce3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3985

The wildcard function in make 3.82 no longer sorts the output, so
add an explicit sort so the defconfigs are listed in a sensible order.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    1 +
 Makefile |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 06a7e53..a6016cc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -31,6 +31,7 @@
 	#3595: patch to add libroxml
 	#3565: libnss: Add new package
 	#3907: 2011.05 - Qt 4.7.3 not building on ARM
+	#3985: "help" target's defconfig list needs sort
 
 2011.05, Released May 27th, 2011:
 
diff --git a/Makefile b/Makefile
index ffe6343..02a1659 100644
--- a/Makefile
+++ b/Makefile
@@ -668,7 +668,7 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
-	@$(foreach b, $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig)), \
+	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
 	@echo 'See docs/README and docs/buildroot.html for further details'
-- 
1.7.3.4
