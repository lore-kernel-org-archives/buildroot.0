From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu, 16 Dec 2010 20:35:08 -0600
Subject: [Buildroot] [PATCH] psmisc: bump to version 22.13
Message-ID: <50fdf9b9da0ad5602517bd81006c0dd2c6475b6d.1292553281.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/psmisc/psmisc-no-__progname.patch |   26 +++++++++++---------------
 package/psmisc/psmisc.mk                  |    2 +-
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/package/psmisc/psmisc-no-__progname.patch b/package/psmisc/psmisc-no-__progname.patch
index 82e6daf..6a73f54 100644
--- a/package/psmisc/psmisc-no-__progname.patch
+++ b/package/psmisc/psmisc-no-__progname.patch
@@ -4,21 +4,17 @@ uclibc (per default) doesn't implement __progname, and the pstree.x11
 stuff isn't that critical, so just disable it.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/pstree.c |    3 ---
- 1 file changed, 3 deletions(-)
 
-Index: psmisc-22.8/src/pstree.c
-===================================================================
---- psmisc-22.8.orig/src/pstree.c
-+++ psmisc-22.8/src/pstree.c
-@@ -893,9 +893,6 @@ main (int argc, char **argv)
-   bindtextdomain(PACKAGE, LOCALEDIR);
-   textdomain(PACKAGE);
+diff -ru psmisc-22.13.orig/src/pstree.c psmisc-22.13/src/pstree.c
+--- psmisc-22.13.orig/src/pstree.c	2010-07-12 06:10:03.000000000 -0500
++++ psmisc-22.13/src/pstree.c	2010-12-16 20:30:14.000000000 -0600
+@@ -854,9 +854,6 @@
+     textdomain(PACKAGE);
  #endif
--  
--  if (!strcmp(__progname, "pstree.x11"))
--    wait_end=1;
  
-   /*
-    * Attempt to figure out a good default symbol set.  Will be overriden by
+-    if (!strcmp(__progname, "pstree.x11"))
+-        wait_end = 1;
+-
+     /*
+      * Attempt to figure out a good default symbol set.  Will be overriden by
+      * command-line options, if given.
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index e4301da..43d4d9b 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -3,7 +3,7 @@
 # psmisc
 #
 #############################################################
-PSMISC_VERSION:=22.8
+PSMISC_VERSION:=22.13
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_AUTORECONF:=NO
-- 
1.7.3.2
