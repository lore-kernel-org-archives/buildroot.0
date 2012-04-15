From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 14:02:10 +0200
Subject: [Buildroot] [git commit] screen: fix build when libelf is enabled
Message-ID: <20120415120358.5291196AC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fadbb58abb54f816f13367c9af4323136f4cf49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

screen's configure script thinks it is running on a SVR4 system when it
detects libelf, breaking the build.

At the same time cleanup the package somewhat, and ensure the correct
CFLAGS are used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/screen/screen.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 2dfb8f2..4b3d427 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -7,8 +7,8 @@
 SCREEN_VERSION = 4.0.3
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_DEPENDENCIES = ncurses
-SCREEN_CONF_ENV = CFLAGS=-DSYSV=1
-SCREEN_MAKE_OPT = -j1
+SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no
+SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 $(eval $(call AUTOTARGETS))
