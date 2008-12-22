From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libXt
Message-ID: <20081222221019.59F747688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:18 +0000 (Mon, 22 Dec 2008)
New Revision: 24508

Log:
x11r7/libXt: use {C,LD}FLAGS_FOR_BUILD for host tools

Modified:
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.4-makestrs-nocc.patch


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.4-makestrs-nocc.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.4-makestrs-nocc.patch	2008-12-22 22:10:14 UTC (rev 24507)
+++ trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.4-makestrs-nocc.patch	2008-12-22 22:10:18 UTC (rev 24508)
@@ -8,7 +8,7 @@
  LINK = $(LIBTOOL) $(LT_QUIET) --tag=CC --mode=link $(CCLD) \
  	$(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
 +makestrs_LINK = $(HOST_CC) \
-+	$(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  SOURCES = $(makestrs_SOURCES)
  DIST_SOURCES = $(makestrs_SOURCES)
  am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
@@ -26,22 +26,22 @@
  makestrs-makestrs.o: makestrs.c
  	@@AMPRETTYECHO@ '  [C         ]  makestrs.c'
 - at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.o -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c; \
-+ at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.o -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c; \
++ at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makestrs-makestrs.o -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c; \
  @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/makestrs-makestrs.Tpo" "$(DEPDIR)/makestrs-makestrs.Po"; else rm -f "$(DEPDIR)/makestrs-makestrs.Tpo"; exit 1; fi
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	@AMSHOWCMDSAT at source='makestrs.c' object='makestrs-makestrs.o' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c
-+ at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c
++ at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makestrs-makestrs.o `test -f 'makestrs.c' || echo '$(srcdir)/'`makestrs.c
  
  makestrs-makestrs.obj: makestrs.c
  	@@AMPRETTYECHO@ '  [C         ]  makestrs.c'
 - at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.obj -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`; \
-+ at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -MT makestrs-makestrs.obj -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`; \
++ at am__fastdepCC_TRUE@	@AMSHOWCMDSAT at if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -MT makestrs-makestrs.obj -MD -MP -MF "$(DEPDIR)/makestrs-makestrs.Tpo" -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`; \
  @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/makestrs-makestrs.Tpo" "$(DEPDIR)/makestrs-makestrs.Po"; else rm -f "$(DEPDIR)/makestrs-makestrs.Tpo"; exit 1; fi
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	@AMSHOWCMDSAT at source='makestrs.c' object='makestrs-makestrs.obj' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`
-+ at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS) -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`
++ at am__fastdepCC_FALSE@	@AMDEPSHOWCMDSAT@$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(makestrs_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o makestrs-makestrs.obj `if test -f 'makestrs.c'; then $(CYGPATH_W) 'makestrs.c'; else $(CYGPATH_W) '$(srcdir)/makestrs.c'; fi`
  
  mostlyclean-libtool:
  	@@AMPRETTYECHO@ '  [RM        ]  *.lo'
