From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 11:55:12 +0200
Subject: [Buildroot] [PATCH 1/4] xorg: bump libXt to 1.0.6
In-Reply-To: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5d4138392026cfd61e25a8e1a170fbe422f49a83.1248774911.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump libXt to 1.0.6 and remove the
xlib_libXt-1.0.5-makestrs-nocc.patch, which has been included in a
better form in upstream:
 http://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=36e9f0d351afbf7fd2595990b2d39e7c551f6420

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xlib_libXt-1.0.5-makestrs-nocc.patch           |   52 --------------------
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 2 files changed, 1 insertions(+), 53 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch

diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch
deleted file mode 100644
index 284ce62..0000000
--- a/package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
----
- util/Makefile.in |   13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-Index: libXt-1.0.5/util/Makefile.in
-===================================================================
---- libXt-1.0.5.orig/util/Makefile.in
-+++ libXt-1.0.5/util/Makefile.in
-@@ -64,8 +64,11 @@
- 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
-+HOST_CC = gcc
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
- 	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+makestrs_LINK = $(HOST_CC) \
-+	$(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- SOURCES = $(makestrs_SOURCES)
- DIST_SOURCES = $(makestrs_SOURCES)
- am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
-@@ -297,7 +300,7 @@
- 	done
- makestrs$(EXEEXT): $(makestrs_OBJECTS) $(makestrs_DEPENDENCIES) 
- 	@rm -f makestrs$(EXEEXT)
--	$(LINK) $(makestrs_LDFLAGS) $(makestrs_OBJECTS) $(makestrs_LDADD) $(LIBS)
-+	$(makestrs_LINK) $(makestrs_LDFLAGS) $(makestrs_OBJECTS) $(makestrs_LDADD) $(LIBS)
- 
- mostlyclean-compile:
- 	-rm -f *.$(OBJEXT)
-@@ -329,18 +332,18 @@
- @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
- 
- makestrs-makestrs.o: makestrs.c
-- at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.o -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makestrs-makestrs.o -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c; \
- @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/makestrs-makestrs.Tpo" "$(DEPDIR)/makestrs-makestrs.Po"; else rm -f "$(DEPDIR)/makestrs-makestrs.Tpo"; exit 1; fi
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makestrs.c' object='makestrs-makestrs.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c
- 
- makestrs-makestrs.obj: makestrs.c
-- at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.obj -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makestrs-makestrs.obj -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`; \
- @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/makestrs-makestrs.Tpo" "$(DEPDIR)/makestrs-makestrs.Po"; else rm -f "$(DEPDIR)/makestrs-makestrs.Tpo"; exit 1; fi
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makestrs.c' object='makestrs-makestrs.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`
-+@am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 546721a..13e43c1 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.0.5
+XLIB_LIBXT_VERSION = 1.0.6
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = NO
-- 
1.6.0.4
