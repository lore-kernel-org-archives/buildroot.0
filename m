From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 18:34:00 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_fbgrab=3A_bump_to_version_1?=
	=?utf-8?q?=2E2?=
Message-ID: <1381509240-5742-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch:
- fbgrab-proper-Makefile-for-cross-compiling.patch
has been integrated in the new upstream version.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 ...bgrab-proper-Makefile-for-cross-compiling.patch |   39 --------------------
 package/fbgrab/fbgrab.mk                           |    2 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch

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
-Reworked original patch from: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
-
-Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
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
-- 
1.7.9.5
