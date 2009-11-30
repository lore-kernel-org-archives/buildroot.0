From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 17:31:56 +0100
Subject: [Buildroot] [git commit master] Makefile: use absolute path for
	TOPDIR
Message-ID: <20091130163717.98329777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b1dd45bf4c825fe545e7ca278de21e418a6f994
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by mr_claus on IRC.

This ensure DL_DIR is always an absolute path, like it was before the
build dir reorganization - Fixes vim (patch) build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 +-
 Makefile |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 97ca4e7..d319525 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: alsamixergui, fltk, ncurses
+	Updated/fixed packages: alsamixergui, fltk, ncurses, vim
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Makefile b/Makefile
index 018cf6d..904121e 100644
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,8 @@
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
-TOPDIR:=.
+# absolute path
+TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
 CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
-- 
1.6.3.3
