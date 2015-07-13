From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:26:20 +0200
Subject: [Buildroot] [PATCH] gptfdisk: bump version 1.0.0
Message-ID: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/gptfdisk/0001-ldlibs.patch | 2 +-
 package/gptfdisk/gptfdisk.hash     | 6 +++---
 package/gptfdisk/gptfdisk.mk       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gptfdisk/0001-ldlibs.patch b/package/gptfdisk/0001-ldlibs.patch
index ca1d7fb..280dfc9 100644
--- a/package/gptfdisk/0001-ldlibs.patch
+++ b/package/gptfdisk/0001-ldlibs.patch
@@ -15,7 +15,7 @@ diff -Nura gptfdisk-0.8.10.orig/Makefile gptfdisk-0.8.10/Makefile
  
  cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
 -	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw $(LDLIBS) -o cgdisk
++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses $(LDLIBS) -o cgdisk
  #	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
  
  sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 93f7b36..0a72e0d 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/0.8.10/
-md5	9cf4246c181c324bdbd553fe9b348373	gptfdisk-0.8.10.tar.gz
-sha1	1708e232220236b6bdf299b315e9bc2205c01ba5	gptfdisk-0.8.10.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.0/
+md5	2061f917af084215898d4fea04d8388f	gptfdisk-1.0.0.tar.gz
+sha1	97f25db2def1c1939ed3954520bfd9948806d95a	gptfdisk-1.0.0.tar.gz
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index f812376..abfddfb 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 0.8.10
+GPTFDISK_VERSION = 1.0.0
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPLv2+
 GPTFDISK_LICENSE_FILES = COPYING
-- 
2.4.5
