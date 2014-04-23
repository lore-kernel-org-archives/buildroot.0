From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:20:17 +0200
Subject: [Buildroot] [git commit] Makefile: fix coding style regarding the
	'=' sign
Message-ID: <20140423222043.B9EA29C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e49d69bd222163225b2a02fa03f9911a75abe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in the buildroot user manual add just a single space before
and after a '=' sign.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |  198 +++++++++++++++++++++++++++++++-------------------------------
 1 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/Makefile b/Makefile
index d10da9d..fc111b3 100644
--- a/Makefile
+++ b/Makefile
@@ -25,10 +25,10 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2014.05-git
+export BR2_VERSION := 2014.05-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
-MIN_MAKE_VERSION=3.81
+MIN_MAKE_VERSION = 3.81
 ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
 $(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
@@ -60,33 +60,33 @@ export HOSTARCH := $(shell uname -m | \
 .NOTPARALLEL:
 
 # absolute path
-TOPDIR:=$(shell pwd)
-CONFIG_CONFIG_IN=Config.in
-CONFIG=support/kconfig
-DATE:=$(shell date +%Y%m%d)
+TOPDIR := $(shell pwd)
+CONFIG_CONFIG_IN = Config.in
+CONFIG = support/kconfig
+DATE := $(shell date +%Y%m%d)
 
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
-export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
+export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
-noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
+noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check print-version olddefconfig
 
 # Strip quotes and then whitespaces
-qstrip=$(strip $(subst ",,$(1)))
+qstrip = $(strip $(subst ",,$(1)))
 #"))
 
 # Variables for use in Make constructs
-comma:=,
-empty:=
-space:=$(empty) $(empty)
+comma := ,
+empty :=
+space := $(empty) $(empty)
 
 ifneq ("$(origin O)", "command line")
-O:=output
-CONFIG_DIR:=$(TOPDIR)
-NEED_WRAPPER=
+O := output
+CONFIG_DIR := $(TOPDIR)
+NEED_WRAPPER =
 else
 # other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. Busybox does). As make automatically
@@ -98,18 +98,18 @@ MAKEOVERRIDES =
 # of the origin function (command line -> environment).
 # Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
 # To really make O go away, we have to override it.
-override O:=$(O)
-CONFIG_DIR:=$(O)
+override O := $(O)
+CONFIG_DIR := $(O)
 # we need to pass O= everywhere we call back into the toplevel makefile
 EXTRAMAKEARGS = O=$(O)
-NEED_WRAPPER=y
+NEED_WRAPPER = y
 endif
 
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
 # explictly throw away any output from 'cd' here.
-export CDPATH:=
+export CDPATH :=
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
@@ -152,26 +152,26 @@ endif
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 BR_GRAPH_DEPTH := $(or $(BR2_GRAPH_DEPTH),0)
 
-BUILD_DIR:=$(BASE_DIR)/build
-BINARIES_DIR:=$(BASE_DIR)/images
-TARGET_DIR:=$(BASE_DIR)/target
+BUILD_DIR := $(BASE_DIR)/build
+BINARIES_DIR := $(BASE_DIR)/images
+TARGET_DIR := $(BASE_DIR)/target
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
-HOST_DIR:=$(BASE_DIR)/host
-
-LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
-REDIST_SOURCES_DIR_TARGET=$(LEGAL_INFO_DIR)/sources
-REDIST_SOURCES_DIR_HOST=$(LEGAL_INFO_DIR)/host-sources
-LICENSE_FILES_DIR_TARGET=$(LEGAL_INFO_DIR)/licenses
-LICENSE_FILES_DIR_HOST=$(LEGAL_INFO_DIR)/host-licenses
-LEGAL_MANIFEST_CSV_TARGET=$(LEGAL_INFO_DIR)/manifest.csv
-LEGAL_MANIFEST_CSV_HOST=$(LEGAL_INFO_DIR)/host-manifest.csv
-LEGAL_LICENSES_TXT_TARGET=$(LEGAL_INFO_DIR)/licenses.txt
-LEGAL_LICENSES_TXT_HOST=$(LEGAL_INFO_DIR)/host-licenses.txt
-LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
-LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
-
-BR2_CONFIG=$(CONFIG_DIR)/.config
+HOST_DIR := $(BASE_DIR)/host
+
+LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
+REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
+REDIST_SOURCES_DIR_HOST = $(LEGAL_INFO_DIR)/host-sources
+LICENSE_FILES_DIR_TARGET = $(LEGAL_INFO_DIR)/licenses
+LICENSE_FILES_DIR_HOST = $(LEGAL_INFO_DIR)/host-licenses
+LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
+LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
+LEGAL_LICENSES_TXT_TARGET = $(LEGAL_INFO_DIR)/licenses.txt
+LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
+LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
+LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
+
+BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
@@ -182,80 +182,80 @@ endif
 # Use 'make V=1' to see the full commands
 ifdef V
   ifeq ("$(origin V)", "command line")
-    KBUILD_VERBOSE=$(V)
+    KBUILD_VERBOSE = $(V)
   endif
 endif
 ifndef KBUILD_VERBOSE
-  KBUILD_VERBOSE=0
+  KBUILD_VERBOSE = 0
 endif
 
 ifeq ($(KBUILD_VERBOSE),1)
-  quiet=
-  Q=
+  quiet =
+  Q =
 ifndef VERBOSE
-  VERBOSE=1
+  VERBOSE = 1
 endif
 else
-  quiet=quiet_
-  Q=@
+  quiet = quiet_
+  Q = @
 endif
 
 # we want bash as shell
-SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-	else if [ -x /bin/bash ]; then echo /bin/bash; \
-	else echo sh; fi; fi)
+SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+	 else if [ -x /bin/bash ]; then echo /bin/bash; \
+	 else echo sh; fi; fi)
 
 # kconfig uses CONFIG_SHELL
-CONFIG_SHELL:=$(SHELL)
+CONFIG_SHELL := $(SHELL)
 
 export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
 
 ifndef HOSTAR
-HOSTAR:=ar
+HOSTAR := ar
 endif
 ifndef HOSTAS
-HOSTAS:=as
+HOSTAS := as
 endif
 ifndef HOSTCC
-HOSTCC:=gcc
-HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC := gcc
+HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
-HOSTCC_NOCCACHE:=$(HOSTCC)
+HOSTCC_NOCCACHE := $(HOSTCC)
 ifndef HOSTCXX
-HOSTCXX:=g++
-HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX := g++
+HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
-HOSTCXX_NOCCACHE:=$(HOSTCXX)
+HOSTCXX_NOCCACHE := $(HOSTCXX)
 ifndef HOSTFC
-HOSTFC:=gfortran
+HOSTFC := gfortran
 endif
 ifndef HOSTCPP
-HOSTCPP:=cpp
+HOSTCPP := cpp
 endif
 ifndef HOSTLD
-HOSTLD:=ld
+HOSTLD := ld
 endif
 ifndef HOSTLN
-HOSTLN:=ln
+HOSTLN := ln
 endif
 ifndef HOSTNM
-HOSTNM:=nm
+HOSTNM := nm
 endif
 ifndef HOSTOBJCOPY
-HOSTOBJCOPY:=objcopy
+HOSTOBJCOPY := objcopy
 endif
 ifndef HOSTRANLIB
-HOSTRANLIB:=ranlib
-endif
-HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
-HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
-HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
-HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
-HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
-HOSTOBJCOPY:=$(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
-HOSTRANLIB:=$(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+HOSTRANLIB := ranlib
+endif
+HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTFC := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
+HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
+HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
+HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
@@ -292,17 +292,17 @@ unexport CONFIG_SITE
 unexport QMAKESPEC
 unexport TERMINFO
 
-GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
+GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
 TARGETS :=
 
 # silent mode requested?
-QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
 
 # Strip off the annoying quoting
-ARCH:=$(call qstrip,$(BR2_ARCH))
+ARCH := $(call qstrip,$(BR2_ARCH))
 
-KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
+KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arcle/arc/ \
 	-e s/arceb/arc/ \
@@ -315,31 +315,31 @@ KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/sh.*/sh/ \
 	-e s/microblazeel/microblaze/)
 
-ZCAT:=$(call qstrip,$(BR2_ZCAT))
-BZCAT:=$(call qstrip,$(BR2_BZCAT))
-XZCAT:=$(call qstrip,$(BR2_XZCAT))
-TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
+ZCAT := $(call qstrip,$(BR2_ZCAT))
+BZCAT := $(call qstrip,$(BR2_BZCAT))
+XZCAT := $(call qstrip,$(BR2_XZCAT))
+TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # packages compiled for the host go here
-HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
+HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
 # locales to generate
-GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
+GENERATE_LOCALE = $(call qstrip,$(BR2_GENERATE_LOCALE))
 
-TARGET_SKELETON=$(TOPDIR)/system/skeleton
+TARGET_SKELETON = $(TOPDIR)/system/skeleton
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE:=$(HOST_DIR)/usr/bin/ccache
+CCACHE := $(HOST_DIR)/usr/bin/ccache
 BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
-HOSTCC  := $(CCACHE) $(HOSTCC)
+HOSTCC := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
@@ -378,7 +378,7 @@ include toolchain/*/*.mk
 
 # Include the package override file if one has been provided in the
 # configuration.
-PACKAGE_OVERRIDE_FILE=$(call qstrip,$(BR2_PACKAGE_OVERRIDE_FILE))
+PACKAGE_OVERRIDE_FILE = $(call qstrip,$(BR2_PACKAGE_OVERRIDE_FILE))
 ifneq ($(PACKAGE_OVERRIDE_FILE),)
 -include $(PACKAGE_OVERRIDE_FILE)
 endif
@@ -392,23 +392,23 @@ include system/system.mk
 include $(BR2_EXTERNAL)/external.mk
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-TARGETS+=target-purgelocales
+TARGETS += target-purgelocales
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ifneq ($(GENERATE_LOCALE),)
-TARGETS+=target-generatelocales
+TARGETS += target-generatelocales
 endif
 endif
 
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
-TARGETS+=toolchain-eclipse-register
+TARGETS += toolchain-eclipse-register
 endif
 
 include fs/common.mk
 
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
-TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
+TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
+TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
 # visible in Kconfig and hence not added to a variable like TARGETS.
@@ -429,7 +429,7 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
-TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
+TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
 		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -482,7 +482,7 @@ $(STAGING_DIR):
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+TARGET_SKELETON = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
 
 RSYNC_VCS_EXCLUSIONS = \
@@ -576,8 +576,8 @@ endif
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
-LOCALE_NOPURGE=$(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
+LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
+LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
 target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
@@ -682,7 +682,7 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # configuration
 # ---------------------------------------------------------------------------
 
-HOSTCFLAGS=$(CFLAGS_FOR_BUILD)
+HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
 $(BUILD_DIR)/buildroot-config/%onf:
@@ -911,7 +911,7 @@ endif
 	@echo 'See docs/README, or generate the Buildroot manual for further details'
 	@echo
 
-release: OUT=buildroot-$(BR2_VERSION)
+release: OUT = buildroot-$(BR2_VERSION)
 
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
