From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:49 -0300
Subject: [Buildroot] [PATCH 01/10] lame: bump to version 3.99
Message-ID: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/lame/lame-no-static.patch |   28 --------------------------
 package/multimedia/lame/lame.mk              |    3 +-
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/multimedia/lame/lame-no-static.patch

diff --git a/package/multimedia/lame/lame-no-static.patch b/package/multimedia/lame/lame-no-static.patch
deleted file mode 100644
index f507f7f..0000000
--- a/package/multimedia/lame/lame-no-static.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-We don't want statically compiled binaries by force so nuke that.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lame-3.98.4/frontend/Makefile.am lame-3.98.4.nostatic/frontend/Makefile.am
---- lame-3.98.4/frontend/Makefile.am	2006-09-30 06:17:05.000000000 -0300
-+++ lame-3.98.4.nostatic/frontend/Makefile.am	2011-02-10 13:46:05.512559590 -0300
-@@ -52,7 +52,7 @@
- endif
- 
- CFLAGS = @CFLAGS@ @GTK_CFLAGS@ @FRONTEND_CFLAGS@ @SNDFILE_CFLAGS@
--LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@ -static
-+LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@
- 
- INCLUDES = -I$(top_srcdir)/libmp3lame -I$(top_srcdir)/include -I$(top_builddir)
- 
-diff -Nura lame-3.98.4/frontend/Makefile.in lame-3.98.4.nostatic/frontend/Makefile.in
---- lame-3.98.4/frontend/Makefile.in	2008-06-25 09:17:51.000000000 -0300
-+++ lame-3.98.4.nostatic/frontend/Makefile.in	2011-02-10 13:45:54.752559590 -0300
-@@ -152,7 +152,7 @@
- 	$(top_builddir)/libmp3lame/libmp3lame.la \
- 	@FRONTEND_LDADD@
- 
--LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@ -static
-+LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@
- LIBOBJS = @LIBOBJS@
- LIBS = @LIBS@
- LIBTOOL = @LIBTOOL@
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 7609f2d..fbf0dda 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-LAME_VERSION = 3.98.4
+LAME_VERSION = 3.99
 LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lame
 LAME_DEPENDENCIES = host-pkg-config
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
+LAME_CONF_OPT = --enable-dynamic-frontends
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
-- 
1.7.3.4
