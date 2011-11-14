From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:24:27 +0100
Subject: [Buildroot] [git commit branch/next] lame: bump to version 3.99
Message-ID: <20111114083546.D5C2F8F55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e88733af5746c723e6a3a3c5fd1974faa11fa38b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/lame/lame-no-static.patch |   28 --------------------------
 package/multimedia/lame/lame.mk              |    3 +-
 2 files changed, 2 insertions(+), 29 deletions(-)

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
