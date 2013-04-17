From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Apr 2013 10:00:07 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2013.57
Message-ID: <1366203607-19347-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear-fix-vfork-logic.patch | 21 ---------------------
 package/dropbear/dropbear.mk                    |  2 +-
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 package/dropbear/dropbear-fix-vfork-logic.patch

diff --git a/package/dropbear/dropbear-fix-vfork-logic.patch b/package/dropbear/dropbear-fix-vfork-logic.patch
deleted file mode 100644
index 2706bc8..0000000
--- a/package/dropbear/dropbear-fix-vfork-logic.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-# HG changeset patch
-# User Matt Johnston <matt@ucc.asn.au>
-# Date 1364743743 -28800
-# Node ID fedfb8ede1fdebad5d19df7bd4d452c3264d9545
-# Parent  f27058078d61a8c3a057530d3ddcd19bd5062569
-Fix incorrect logic for USE_VFORK and calling arg_setup()
-
-diff -r f27058078d61 -r fedfb8ede1fd scp.c
---- a/scp.c	Sun Mar 31 23:15:35 2013 +0800
-+++ b/scp.c	Sun Mar 31 23:29:03 2013 +0800
-@@ -230,7 +230,7 @@
- 		close(pin[0]);
- 		close(pout[1]);
- 
--#ifdef USE_VFORK
-+#ifndef USE_VFORK
- 		arg_setup(host, remuser, cmd);
- #endif
- 
-
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index cec57db..0715555 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 2013.56
+DROPBEAR_VERSION = 2013.57
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-- 
1.8.1.5
