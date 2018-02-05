From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 18:18:16 +0100
Subject: [Buildroot] [git commit branch/next] x11vnc: update to 0.9.15
Message-ID: <20180205171818.7068F88446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99c6f9fba171a73d899e93c8ce944be5a154ceb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This updates x11vnc from 0.9.14 to 0.9.15. The cherry-picked patch is now
part of the release.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...r-detection-when-using-without-crypt-cryp.patch | 27 ----------------------
 package/x11vnc/x11vnc.hash                         |  2 +-
 package/x11vnc/x11vnc.mk                           |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch b/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch
deleted file mode 100644
index 31b5cfed7d..0000000000
--- a/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d6919c0be7f531b20cbfcb9929d697ac3c132c40 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <github@kempniu.pl>
-Date: Wed, 12 Oct 2016 15:17:51 +0200
-Subject: [PATCH] Fix compiler detection when using
- --without-{crypt,crypto,ssl}
-
-(cherry picked from commit d6919c0be7f531b20cbfcb9929d697ac3c132c40)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 55724bc..bdfff94 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -5,6 +5,7 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AM_CONFIG_HEADER(config.h)
- AC_CONFIG_MACRO_DIR([m4])
- 
-+AC_PROG_CC
- AC_PROG_SED
- 
- # some OS's need both -lssl and -lcrypto on link line:
--- 
-2.9.3
-
diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
index 3cdbfa1b0f..86f41044db 100644
--- a/package/x11vnc/x11vnc.hash
+++ b/package/x11vnc/x11vnc.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  x11vnc-0.9.14.tar.gz
+sha256  3e43bd875edc3c7f52a0d3676c4ec7de910fcd210240ee20b4522deb2bf84cff  x11vnc-0.9.15.tar.gz
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index f1f4da21bc..0fa87d2d82 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X11VNC_VERSION = 0.9.14
+X11VNC_VERSION = 0.9.15
 X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
