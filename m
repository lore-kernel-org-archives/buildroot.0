From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:22 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xlib_liblbxutil
Message-ID: <20081222221022.F045F7688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:22 +0000 (Mon, 22 Dec 2008)
New Revision: 24509

Log:
x11r7/liblbxutil: use {C,LD}FLAGS_FOR_BUILD for host tools

Modified:
   trunk/buildroot/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch	2008-12-22 22:10:18 UTC (rev 24508)
+++ trunk/buildroot/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch	2008-12-22 22:10:22 UTC (rev 24509)
@@ -7,8 +7,8 @@
 +HOST_CC = gcc
  LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
  	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+mkg3states_LINK = $(HOST_CC) $(AM_CFLAGS) $(CFLAGS) \
-+	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++mkg3states_LINK = $(HOST_CC) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) \
++	$(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  SOURCES = $(liblbxutil_la_SOURCES) $(nodist_liblbxutil_la_SOURCES) \
  	$(mkg3states_SOURCES)
  DIST_SOURCES = $(liblbxutil_la_SOURCES) $(mkg3states_SOURCES)
@@ -26,21 +26,21 @@
  
  mkg3states.o: $(srcdir)/image/mkg3states.c
 - at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.o -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.o -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c; \
++ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -MT mkg3states.o -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c; \
  @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/mkg3states.Tpo" "$(DEPDIR)/mkg3states.Po"; else rm -f "$(DEPDIR)/mkg3states.Tpo"; exit 1; fi
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='$(srcdir)/image/mkg3states.c' object='mkg3states.o' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c
++ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c
  
  mkg3states.obj: $(srcdir)/image/mkg3states.c
 - at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.obj -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.obj -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`; \
++ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -MT mkg3states.obj -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`; \
  @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/mkg3states.Tpo" "$(DEPDIR)/mkg3states.Po"; else rm -f "$(DEPDIR)/mkg3states.Tpo"; exit 1; fi
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='$(srcdir)/image/mkg3states.c' object='mkg3states.obj' libtool=no @AMDEPBACKSLASH@
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
 - at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`
++ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`
  
  mostlyclean-libtool:
  	-rm -f *.lo
