From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 13:02:29 +0200
Subject: [Buildroot] [git commit] fbgrab: bump to version 1.2
Message-ID: <20131014112355.565DD9B9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=908d0236ae2f8b9e3824f3b0cdf3f6519684d151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch:
- fbgrab-proper-Makefile-for-cross-compiling.patch
has been integrated in the new upstream version.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bgrab-proper-Makefile-for-cross-compiling.patch |   39 --------------------
 package/fbgrab/fbgrab.mk                           |    2 +-
 2 files changed, 1 insertions(+), 40 deletions(-)

diff --git a/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch b/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
deleted file mode 100644
index a211774..0000000
--- a/package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2283817b9aed0b6228d0255d5aba7968379c9854 Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Wed, 3 Jul 2013 11:40:36 -0700
-Subject: [PATCH] fbgrab: A proper Makefile for cross compiling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Respect to the CC, CFLAGS and LDFLAGS is required for cross compiling in
-Buildroot. And there's no need to run the source through splint.
-
-Reworked original patch from: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
-
-Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- Makefile |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index aae16e6..2d6b6fc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -3,8 +3,10 @@
- ### modular. So this is a simple gnu Makefile...
- ###
- 
--fbgrab: fbgrab.c
--	gcc -g -Wall fbgrab.c -lpng -lz -o fbgrab
-+LDFLAGS += -lpng -lz
-+
-+fbgrab: fbgrab.o
-+	$(CC) $(LDFLAGS) fbgrab.o -o $@
- 
- install:
- 	install fbgrab /usr/bin/fbgrab
--- 
-1.7.4.1
-
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 1a91f5e..5e83871 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.1
+FBGRAB_VERSION = 1.2
 FBGRAB_SITE = http://fbgrab.monells.se
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPLv2
