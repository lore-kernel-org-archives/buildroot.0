From: Will Newton <will.newton@gmail.com>
Date: Thu, 26 Jan 2012 17:42:56 +0000
Subject: [Buildroot] [PATCH 13/14] libelementary: Add new package
Message-ID: <CAFbHwiTeF+Q5AT5hPws9M=S2cdtc6_Vq2mNcf+u8vu_7UksOBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in                              |    1 +
 package/efl/libelementary/Config.in                |   19 ++++
 .../libelementary-0.8.0.65643-examples1.patch      |   10 ++
 .../libelementary-0.8.0.65643-examples2.patch      |   96 ++++++++++++++++++++
 package/efl/libelementary/libelementary.mk         |   22 +++++
 5 files changed, 148 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libelementary/Config.in
 create mode 100644
package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
 create mode 100644
package/efl/libelementary/libelementary-0.8.0.65643-examples2.patch
 create mode 100644 package/efl/libelementary/libelementary.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1632290..ec8c513 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -17,6 +17,7 @@ source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
+source "package/efl/libelementary/Config.in"

 endif # BR2_PACKAGE_EFL

diff --git a/package/efl/libelementary/Config.in
b/package/efl/libelementary/Config.in
new file mode 100644
index 0000000..507f142
--- /dev/null
+++ b/package/efl/libelementary/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBELEMENTARY
+	bool "libelementary"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEDJE
+	help
+	  Elementary is a widget toolkit and EFL wrapper and convenience
+	  library to make it easy to build applications and tools with UIs
+	  with less code.
+
+if BR2_PACKAGE_LIBELEMENTARY
+
+config BR2_PACKAGE_LIBELEMENTARY_EXAMPLES
+	bool "libelementary examples"
+	help
+	  Build and install the elemenatry examples.
+
+endif
diff --git a/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
new file mode 100644
index 0000000..9b81ab6
--- /dev/null
+++ b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
@@ -0,0 +1,10 @@
+index_example01 requires a dict.txt file containing strings that does
not seem to be
+included in the snapshot. Add a dumym file to allow it to build.
+
+--- libelementary-0.8.0.65643/src/examples/dict.txt	1970-01-01
01:00:00.000000000 +0100
++++ libelementary-0.8.0.65643.mod/src/examples/dict.txt	2012-01-19
17:37:08.321913533 +0000
+@@ -0,0 +1,4 @@
++"aardvark",
++"abnegates",
++"accordion",
++"adroitly",
diff --git a/package/efl/libelementary/libelementary-0.8.0.65643-examples2.patch
b/package/efl/libelementary/libelementary-0.8.0.65643-examples2.patch
new file mode 100644
index 0000000..5e40224
--- /dev/null
+++ b/package/efl/libelementary/libelementary-0.8.0.65643-examples2.patch
@@ -0,0 +1,96 @@
+win_example requires X11 support in EFL, so disable building it. The
.edj files also appear
+to be missing from the snapshot so remove them from the build.
+
+--- libelementary-0.8.0.65643/src/examples/Makefile.in	2011-11-28
11:06:20.000000000 +0000
++++ libelementary-0.8.0.65643.mod/src/examples/Makefile.in	2012-01-19
17:51:53.761924528 +0000
+@@ -39,8 +39,6 @@
+ @EFL_INSTALL_EXAMPLES_TRUE@	dict.txt
+
+ @EFL_BUILD_EXAMPLES_TRUE at am__append_2 = \
+- at EFL_BUILD_EXAMPLES_TRUE@	theme_example.edj \
+- at EFL_BUILD_EXAMPLES_TRUE@	layout_example.edj
+
+ @EFL_BUILD_EXAMPLES_TRUE at am__append_3 = \
+ @EFL_BUILD_EXAMPLES_TRUE@	actionslider_example_01 \
+@@ -125,7 +123,6 @@
+ @EFL_BUILD_EXAMPLES_TRUE@	menu_example_01 \
+ @EFL_BUILD_EXAMPLES_TRUE@	thumb_example_01 \
+ @EFL_BUILD_EXAMPLES_TRUE@	web_example \
+- at EFL_BUILD_EXAMPLES_TRUE@	win_example \
+ @EFL_BUILD_EXAMPLES_TRUE@        efl_thread_1 \
+ @EFL_BUILD_EXAMPLES_TRUE@        efl_thread_2 \
+ @EFL_BUILD_EXAMPLES_TRUE@        efl_thread_3 \
+@@ -239,7 +236,6 @@
+ @EFL_BUILD_EXAMPLES_TRUE@	menu_example_01$(EXEEXT) \
+ @EFL_BUILD_EXAMPLES_TRUE@	thumb_example_01$(EXEEXT) \
+ @EFL_BUILD_EXAMPLES_TRUE@	web_example$(EXEEXT) \
+- at EFL_BUILD_EXAMPLES_TRUE@	win_example$(EXEEXT) \
+ @EFL_BUILD_EXAMPLES_TRUE@	efl_thread_1$(EXEEXT) \
+ @EFL_BUILD_EXAMPLES_TRUE@	efl_thread_2$(EXEEXT) \
+ @EFL_BUILD_EXAMPLES_TRUE@	efl_thread_3$(EXEEXT) \
+@@ -679,10 +675,6 @@
+ web_example_OBJECTS = web_example.$(OBJEXT)
+ web_example_LDADD = $(LDADD)
+ web_example_DEPENDENCIES = $(top_builddir)/src/lib/libelementary.la
+-win_example_SOURCES = win_example.c
+-win_example_OBJECTS = win_example.$(OBJEXT)
+-win_example_LDADD = $(LDADD)
+-win_example_DEPENDENCIES = $(top_builddir)/src/lib/libelementary.la
+ DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -740,8 +732,7 @@
+ 	theme_example_01.c theme_example_02.c thumb_example_01.c \
+ 	toggle_example_01.c toolbar_example_01.c toolbar_example_02.c \
+ 	toolbar_example_03.c transit_example_01.c transit_example_02.c \
+-	transit_example_03.c transit_example_04.c web_example.c \
+-	win_example.c
++	transit_example_03.c transit_example_04.c web_example.c
+ DIST_SOURCES = actionslider_example_01.c anchorblock_example_01.c \
+ 	bg_example_01.c bg_example_02.c bg_example_03.c \
+ 	box_example_02.c bubble_example_01.c button_example_01.c \
+@@ -773,8 +764,7 @@
+ 	theme_example_01.c theme_example_02.c thumb_example_01.c \
+ 	toggle_example_01.c toolbar_example_01.c toolbar_example_02.c \
+ 	toolbar_example_03.c transit_example_01.c transit_example_02.c \
+-	transit_example_03.c transit_example_04.c web_example.c \
+-	win_example.c
++	transit_example_03.c transit_example_04.c web_example.c
+ am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+ am__vpath_adj = case $$p in \
+     $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
+@@ -1097,8 +1087,6 @@
+ 	genlist_example_03.c \
+ 	genlist_example_04.c \
+ 	genlist_example_05.c \
+-	theme_example.edc \
+-	layout_example.edc \
+ 	slider_example.c \
+ 	panes_example.c \
+ 	ctxpopup_example_01.c \
+@@ -1119,7 +1107,6 @@
+ 	menu_example_01.c \
+ 	thumb_example_01.c \
+ 	web_example.c \
+-	win_example.c \
+         efl_thread_1.c \
+         efl_thread_2.c \
+         efl_thread_3.c \
+@@ -1550,9 +1537,6 @@
+ web_example$(EXEEXT): $(web_example_OBJECTS) $(web_example_DEPENDENCIES)
+ 	@rm -f web_example$(EXEEXT)
+ 	$(AM_V_CCLD)$(LINK) $(web_example_OBJECTS) $(web_example_LDADD) $(LIBS)
+-win_example$(EXEEXT): $(win_example_OBJECTS) $(win_example_DEPENDENCIES)
+-	@rm -f win_example$(EXEEXT)
+-	$(AM_V_CCLD)$(LINK) $(win_example_OBJECTS) $(win_example_LDADD) $(LIBS)
+
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)
+@@ -1648,7 +1632,6 @@
+ @AMDEP_TRUE@@am__include@
@am__quote at ./$(DEPDIR)/transit_example_03.Po at am__quote@
+ @AMDEP_TRUE@@am__include@
@am__quote at ./$(DEPDIR)/transit_example_04.Po at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at ./$(DEPDIR)/web_example.Po at am__quote@
+- at AMDEP_TRUE@@am__include@ @am__quote at ./$(DEPDIR)/win_example.Po at am__quote@
+
+ .c.o:
+ @am__fastdepCC_TRUE@	$(AM_V_CC)$(COMPILE) -MT $@ -MD -MP -MF
$(DEPDIR)/$*.Tpo -c -o $@ $<
diff --git a/package/efl/libelementary/libelementary.mk
b/package/efl/libelementary/libelementary.mk
new file mode 100644
index 0000000..e0bd759
--- /dev/null
+++ b/package/efl/libelementary/libelementary.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libelementary
+#
+################################################################################
+
+LIBELEMENTARY_VERSION = 0.8.0.65643
+LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
+LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBELEMENTARY_INSTALL_STAGING = YES
+
+LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
+				host-libeet
+
+LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
+
+ifeq ($(BR2_PACKAGE_LIBELEMENTARY_EXAMPLES),y)
+LIBELEMENTARY_CONF_OPT += --enable-build-examples --enable-install-examples
+endif
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
-------------- next part --------------
