From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libX11
Message-ID: <20081222221015.A8D137688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:14 +0000 (Mon, 22 Dec 2008)
New Revision: 24507

Log:
x11r7/libX11: use {C,LD}FLAGS_FOR_BUILD for host tools

Modified:
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.3-makekeys-nocc.patch


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.3-makekeys-nocc.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.3-makekeys-nocc.patch	2008-12-22 20:18:56 UTC (rev 24506)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.3-makekeys-nocc.patch	2008-12-22 22:10:14 UTC (rev 24507)
@@ -1,14 +1,14 @@
 --- a/src/util/Makefile.in.orig	2008-01-30 10:54:59.000000000 -0500
 +++ b/src/util/Makefile.in	2008-01-30 10:54:16.000000000 -0500
-@@ -50,8 +50,8 @@ PROGRAMS = $(noinst_PROGRAMS)
+@@ -50,8 +50,7 @@ PROGRAMS = $(noinst_PROGRAMS)
  makekeys_SOURCES = makekeys.c
  makekeys_OBJECTS = makekeys-makekeys.$(OBJEXT)
  makekeys_LDADD = $(LDADD)
 -makekeys_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) \
 -	--mode=link $(CCLD) $(makekeys_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
 +HOST_CC = gcc
-+makekeys_LINK = $(HOST_CC) $(makekeys_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
- 	$(LDFLAGS) -o $@
++makekeys_LINK = $(HOST_CC) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
  DEFAULT_INCLUDES = -I. -I$(top_builddir)/src -I$(top_builddir)/include/X11 at am__isrc@
  depcomp = $(SHELL) $(top_srcdir)/depcomp
 @@ -307,18 +307,18 @@ distclean-compile:
@@ -16,21 +16,21 @@
  
  makekeys-makekeys.o: makekeys.c
 - at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.o -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
-+ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.o -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
++ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makekeys-makekeys.o -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
  @am__fastdepCC_TRUE@	mv -f $(DEPDIR)/makekeys-makekeys.Tpo $(DEPDIR)/makekeys-makekeys.Po
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makekeys.c' object='makekeys-makekeys.o' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
++ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makekeys-makekeys.o `test -f 'makekeys.c' || echo '$(srcdir)/'`makekeys.c
  
  makekeys-makekeys.obj: makekeys.c
 - at am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.obj -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
-+ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -MT makekeys-makekeys.obj -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
++ at am__fastdepCC_TRUE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makekeys-makekeys.obj -MD -MP -MF $(DEPDIR)/makekeys-makekeys.Tpo -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
  @am__fastdepCC_TRUE@	mv -f $(DEPDIR)/makekeys-makekeys.Tpo $(DEPDIR)/makekeys-makekeys.Po
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='makekeys.c' object='makekeys-makekeys.obj' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS) -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
++ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makekeys_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makekeys-makekeys.obj `if test -f 'makekeys.c'; then $(CYGPATH_W) 'makekeys.c'; else $(CYGPATH_W) '$(srcdir)/makekeys.c'; fi`
  
  mostlyclean-libtool:
  	-rm -f *.lo
