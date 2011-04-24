From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Apr 2011 00:10:45 +0200
Subject: [Buildroot] [git commit] Makefile: remove outdated make targets
Message-ID: <20110424221238.7E10F82972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b052862f02f94eaca39fcd576971a84a13b865be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

busybox and linux26 no longer have a -config target, and prepatch only makes
sense for a very specific configuration (BR toolchain with GDB enabled).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 02a5c36..98cc09f 100644
--- a/Makefile
+++ b/Makefile
@@ -637,10 +637,6 @@ ifeq ($(O),output)
 endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
-configured: dirs kernel-headers uclibc-config busybox-config linux26-config
-
-prepatch:	gcc-patched gdb-patched uclibc-patched
-
 cross: $(BASE_TARGETS)
 
 help:
@@ -665,7 +661,6 @@ help:
 	@echo '  randpackageconfig      - New config with random answer to package options'
 	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
-	@echo '  configured             - make {uclibc/busybox/linux26}-config'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
1.7.3.4
