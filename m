From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 05:46:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package project
	toolchain/gcc
Message-ID: <20070930124612.0BFF33004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 05:46:02 -0700 (Sun, 30 Sep 2007)
New Revision: 20141

Log:
- whitespace cleanup (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/project/project.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-09-30 12:42:59 UTC (rev 20140)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-09-30 12:46:02 UTC (rev 20141)
@@ -2,20 +2,20 @@
 #
 # Makefile.autotools.in --
 #
-# Implicit and Generated Rules for easily creating autotools-compatible 
+# Implicit and Generated Rules for easily creating autotools-compatible
 # buildroot packages
 #
 ## Example minimal makefile for a package named 'foo'
-# 
+#
 # | FOO_VERSION = 1.0
 # | FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
 # | FOO_SITE = http://www.libfoo.org/dist
 # | $(eval $(call AUTOTARGETS,foo))
-# 
+#
 ## The following targets can be called from the shell:
 #
 # foo, foo-source, foo-patch, foo-configure, foo-build, foo-install,
-# foo-install-target, foo-install-staging, foo-uninstall, foo-clean, 
+# foo-install-target, foo-install-staging, foo-uninstall, foo-clean,
 # foo-dirclean
 #
 ## The following variables which can be (re)defined in the package makefile:
@@ -35,7 +35,7 @@
 # FOO_CONF_OPT [default empty]
 #	arguments passed to the <configure> script
 # FOO_MAKE_ENV [default empty]
-#	environment passed to all calls to <make> in the package source 
+#	environment passed to all calls to <make> in the package source
 #	directory
 # FOO_MAKE_OPT [default empty]
 #	arguments passed to <make> while building
@@ -50,10 +50,10 @@
 # FOO_CLEAN_OPT [default clean]
 #	arguments passed to <make> while installing to the staging directory
 # FOO_UNINSTALL_STAGING_OPT  [default DESTDIR=$(STAGING_DIR)/usr uninstall]
-#	arguments passed to <make> while uninstalling from the staging 
+#	arguments passed to <make> while uninstalling from the staging
 #	directory
 # FOO_UNINSTALL_TARGET_OPT [default DESTDIR=$(STAGING_DIR)/usr uninstall]
-#	arguments passed to <make> while uninstalling from the target 
+#	arguments passed to <make> while uninstalling from the target
 #	directory
 # FOO_SUBDIR [default empty]
 #	relative path in the package source from which to run configure and
@@ -72,12 +72,12 @@
 # FOO_TARGET_CONFIGURE FOO_TARGET_PATCH FOO_TARGET_EXTRACT FOO_TARGET_SOURCE
 # FOO_TARGET_UNINSTALL FOO_TARGET_CLEAN FOO_TARGET_DIRCLEAN
 #
-# E.g. if your package has a no <configure> script you can place the following 
+# E.g. if your package has a no <configure> script you can place the following
 # in your package makefile:
 #
 # | $(FOO_TARGET_INSTALL):
-# | 	touch $@
-# 
+# |	touch $@
+#
 ## The following variables are defined automatically and can be used in
 ## overriden targets:
 #
@@ -90,7 +90,7 @@
 # MESSAGE
 #	macro that outputs a pretty message to stdout, e.g. use
 #	$(call MESSAGE,"Hello World")
-# 	in a target.
+#	in a target.
 #
 # Caveats:
 # - the 'eval' line (final line in the example) must be placed
@@ -98,7 +98,7 @@
 #   (including hooks)
 ################################################################################
 
-# UPPERCASE Macro -- transform its argument to uppercase and replace dots and 
+# UPPERCASE Macro -- transform its argument to uppercase and replace dots and
 # hyphens to underscores
 UPPERCASE = $(shell echo $(1) | tr "a-z.-" "A-Z__")
 
@@ -110,7 +110,7 @@
 INFLATE.tar = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = @echo $(TERM_BOLD) ; \
+MESSAGE = @echo $(TERM_BOLD); \
 	echo ">>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)"; \
 	echo $(TERM_RESET)
 TERM_BOLD = #$(shell tput bold)
@@ -121,7 +121,7 @@
 #ACLOCAL_STAGING_DIR ?= $(STAGING_DIR)/usr/share/aclocal
 #ACLOCAL ?= aclocal -I $(ACLOCAL_STAGING_DIR)
 #AUTORECONF ?= autoreconf -v -i -f -I $(ACLOCAL_STAGING_DIR)
-#	ACLOCAL="$(ACLOCAL)" 
+#	ACLOCAL="$(ACLOCAL)"
 
 
 ################################################################################
@@ -152,14 +152,14 @@
 $(BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	$(Q)(\
-	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) ; then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
+	$(Q)( \
+	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME); then \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)"; then \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
-	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) ; then \
-	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1; \
+	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
+	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1; \
 	    fi; \
 	  fi; \
 	fi; \
@@ -168,7 +168,7 @@
 	$(Q)(for file in config.guess config.sub; do \
 		for i in $$(find $(@D) -name $$file); do \
 			cp package/gnuconfig/$$file $$i; \
-		done;\
+		done; \
 	done)
 endif
 	$(Q)touch $@
@@ -182,12 +182,10 @@
 # Configuring
 $(BUILD_DIR)/%/.stamp_configured:
 	$(call MESSAGE,"Configuring")
-	$(Q)if test "$($(PKG)_AUTORECONF)" = "YES" ; then \
-		cd $(@D)/$($(PKG)_SUBDIR) && \
-		$(AUTORECONF) ; \
+	$(Q)if test "$($(PKG)_AUTORECONF)" = "YES"; then \
+		cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF); \
 	fi
-	cd $(@D)/$($(PKG)_SUBDIR) && \
-	rm -f config.cache && \
+	cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
 	$($(PKG)_CONF_ENV) \
@@ -212,9 +210,9 @@
 	$(call MESSAGE,'Installing to host (staging directory)')
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 #	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
-	for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la") ; do \
-		cp $$i $$i~ ; \
-		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" $$i ; \
+	for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
+		cp $$i $$i~; \
+		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" $$i; \
 	done
 	touch $@
 
@@ -222,14 +220,14 @@
 $(BUILD_DIR)/%/.stamp_target_installed:
 	$(call MESSAGE,"Installing to target")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	$(if $(BR2_HAVE_MANPAGES),,for d in man ; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
+	$(if $(BR2_HAVE_MANPAGES),,for d in man; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
-	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info ; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
+	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
-	$(if $(BR2_HAVE_INCLUDES),,for d in include ; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d ; \
+	$(if $(BR2_HAVE_INCLUDES),,for d in include; do \
+		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
 	find $(TARGET_DIR) -name '*.la' -delete
 	touch $@
@@ -248,7 +246,7 @@
 
 
 ################################################################################
-# AUTOTARGETS -- the target generator macro; define a set of human-readable 
+# AUTOTARGETS -- the target generator macro; define a set of human-readable
 # make targets, stamps, and default per-package variables.
 # Argument 1 is the package directory prefix.
 # Argument 2 is the (lowercase) package name.
@@ -257,7 +255,7 @@
 define AUTOTARGETS
 $(call AUTOTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(1))
 endef
-      
+
 # AUTOTARGETS_INNER -- does the job for AUTOTARGETS; argument 1 is the
 # lowercase package name, argument 2 the uppercase package name,
 # argument 3 the package directory prefix
@@ -274,7 +272,7 @@
 $(2)_AUTORECONF			?= NO
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
-$(2)_MAKE_ENV			?= 
+$(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -304,10 +302,10 @@
 $(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
 
 # human-friendly targets and target sequencing
-$(1): 			$(1)-install
-$(1)-install: 		$(1)-install-staging $(1)-install-target \
+$(1):			$(1)-install
+$(1)-install:		$(1)-install-staging $(1)-install-target \
 			$$($(2)_HOOK_POST_INSTALL)
-			
+
 ifeq ($$($(2)_INSTALL_TARGET),YES)
 $(1)-install-target:	$(1)-build $$($(2)_TARGET_INSTALL_TARGET)
 else
@@ -342,7 +340,7 @@
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
 # non-build targets
-$(1)-uninstall: 	$(1)-configure $$($(2)_TARGET_UNINSTALL)
+$(1)-uninstall:	$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
 $(1)-clean:		$$($(2)_TARGET_CLEAN)
 
@@ -377,4 +375,3 @@
 endef
 
 # :mode=makefile:
-

Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-09-30 12:42:59 UTC (rev 20140)
+++ trunk/buildroot/project/project.mk	2007-09-30 12:46:02 UTC (rev 20141)
@@ -53,4 +53,3 @@
 	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
 	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
 	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)
-

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-30 12:42:59 UTC (rev 20140)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-30 12:46:02 UTC (rev 20141)
@@ -358,7 +358,7 @@
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
-gcc-config:uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) \
+gcc-config: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) \
 	uclibc $(GCC_BUILD_DIR2)/.configured
 
 gcc-clean:
