From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Jul 2014 18:38:37 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/Makefile.in: fix coding style
	regarding the '=' sign
In-Reply-To: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1406306319-11972-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in the buildroot user manual add just a single space before
and after a '=' sign.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/Makefile.in | 148 ++++++++++++++++++++++++++--------------------------
 1 file changed, 74 insertions(+), 74 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 97053ba..fc55850 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -1,24 +1,24 @@
 ifndef MAKE
-MAKE:=make
+MAKE := make
 endif
 ifndef HOSTMAKE
-HOSTMAKE=$(MAKE)
+HOSTMAKE = $(MAKE)
 endif
-HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 # If BR2_LEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
 # while waiting on I/O.
 # If the number of processors is not available, assume one.
 ifeq ($(BR2_JLEVEL),0)
-PARALLEL_JOBS:=$(shell echo \
+PARALLEL_JOBS := $(shell echo \
 	$$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
 else
-PARALLEL_JOBS:=$(BR2_JLEVEL)
+PARALLEL_JOBS := $(BR2_JLEVEL)
 endif
 
-MAKE1:=$(HOSTMAKE) -j1
-MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
+MAKE1 := $(HOSTMAKE) -j1
+MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
@@ -36,21 +36,21 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
-TARGET_OS=uclinux
+TARGET_OS = uclinux
 else
-TARGET_OS=linux
+TARGET_OS = linux
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-LIBC=uclibc
+LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-LIBC=musl
+LIBC = musl
 else
-LIBC=gnu
+LIBC = gnu
 endif
 
 # The ABI suffix is a bit special on ARM, as it needs to be
@@ -59,28 +59,28 @@ endif
 # which explains why we need the test on LIBC below.
 ifeq ($(BR2_arm)$(BR2_armeb),y)
 ifeq ($(LIBC),uclibc)
-ABI=gnueabi
+ABI = gnueabi
 else
-ABI=eabi
+ABI = eabi
 endif
 
 ifeq ($(BR2_ARM_EABIHF),y)
-ABI:=$(ABI)hf
+ABI := $(ABI)hf
 endif
 endif
 
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
-ABI=spe
+ABI = spe
 # MPC8540s are e500v1 with single precision FP
 ifeq ($(BR2_powerpc_8540),y)
-TARGET_ABI+=-mabi=spe -mfloat-gprs=single -Wa,-me500
+TARGET_ABI += -mabi=spe -mfloat-gprs=single -Wa,-me500
 endif
 ifeq ($(BR2_powerpc_8548),y)
-TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500x2
+TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500x2
 endif
 ifeq ($(BR2_powerpc_e500mc),y)
-TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
+TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
@@ -105,31 +105,31 @@ endif
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
-TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
 ifeq ($(BR2_OPTIMIZE_0),y)
-TARGET_OPTIMIZATION+=-O0
+TARGET_OPTIMIZATION += -O0
 endif
 ifeq ($(BR2_OPTIMIZE_1),y)
-TARGET_OPTIMIZATION+=-O1
+TARGET_OPTIMIZATION += -O1
 endif
 ifeq ($(BR2_OPTIMIZE_2),y)
-TARGET_OPTIMIZATION+=-O2
+TARGET_OPTIMIZATION += -O2
 endif
 ifeq ($(BR2_OPTIMIZE_3),y)
-TARGET_OPTIMIZATION+=-O3
+TARGET_OPTIMIZATION += -O3
 endif
 ifeq ($(BR2_OPTIMIZE_S),y)
-TARGET_OPTIMIZATION+=-Os
+TARGET_OPTIMIZATION += -Os
 endif
 ifeq ($(BR2_DEBUG_1),y)
-TARGET_DEBUGGING=-g1
+TARGET_DEBUGGING = -g1
 endif
 ifeq ($(BR2_DEBUG_2),y)
-TARGET_DEBUGGING=-g2
+TARGET_DEBUGGING = -g2
 endif
 ifeq ($(BR2_DEBUG_3),y)
-TARGET_DEBUGGING=-g3
+TARGET_DEBUGGING = -g3
 endif
 
 ifeq ($(BR2_LARGEFILE),y)
@@ -165,9 +165,9 @@ TARGET_CXXFLAGS += -fstack-protector-all
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
+TARGET_CROSS = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
-TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
+TARGET_CROSS = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
 
 # Define TARGET_xx variables for all common binutils/gcc
@@ -193,30 +193,30 @@ TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
 ifeq ($(BR2_STRIP_strip),y)
-STRIP_STRIP_DEBUG:=--strip-debug
-STRIP_STRIP_UNNEEDED:=--strip-unneeded
-STRIP_STRIP_ALL:=--strip-all
-TARGET_STRIP=$(TARGET_CROSS)strip
-STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
+STRIP_STRIP_DEBUG := --strip-debug
+STRIP_STRIP_UNNEEDED := --strip-unneeded
+STRIP_STRIP_ALL := --strip-all
+TARGET_STRIP = $(TARGET_CROSS)strip
+STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
+KSTRIPCMD = $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
-STRIP_STRIP_DEBUG:=
-STRIP_STRIP_UNNEEDED:=
-STRIP_STRIP_ALL:=
-TARGET_STRIP=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-STRIPCMD=$(TARGET_STRIP)
-KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
+STRIP_STRIP_DEBUG :=
+STRIP_STRIP_UNNEEDED :=
+STRIP_STRIP_ALL :=
+TARGET_STRIP = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
+STRIPCMD = $(TARGET_STRIP)
+KSTRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP=true
-STRIPCMD=$(TARGET_STRIP)
-KSTRIPCMD=$(TARGET_STRIP)
+TARGET_STRIP = true
+STRIPCMD = $(TARGET_STRIP)
+KSTRIPCMD = $(TARGET_STRIP)
 endif
-INSTALL:=$(shell which install || type -p install)
-FLEX:=$(shell which flex || type -p flex)
-BISON:=$(shell which bison || type -p bison)
-SED:=$(shell which sed || type -p sed) -i -e
+INSTALL := $(shell which install || type -p install)
+FLEX := $(shell which flex || type -p flex)
+BISON := $(shell which bison || type -p bison)
+SED := $(shell which sed || type -p sed) -i -e
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
@@ -225,13 +225,13 @@ HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
-HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
+HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
 HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
 export PERL5LIB := $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
-TARGET_CONFIGURE_OPTS=PATH=$(BR_PATH) \
+TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
 		LD="$(TARGET_LD)" \
@@ -268,10 +268,10 @@ TARGET_CONFIGURE_OPTS=PATH=$(BR_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(BR_PATH)
+TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
 
-HOST_CONFIGURE_OPTS=PATH=$(BR_PATH) \
+HOST_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD)" \
@@ -293,7 +293,7 @@ HOST_CONFIGURE_OPTS=PATH=$(BR_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-HOST_MAKE_ENV=PATH=$(BR_PATH) \
+HOST_MAKE_ENV = PATH=$(BR_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
@@ -303,7 +303,7 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
-EXTRA_ENV=\
+EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR)
@@ -312,27 +312,27 @@ EXTRA_ENV=\
 # settings we need to pass to configure
 
 # does unaligned access trap?
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
+BR2_AC_CV_TRAP_CHECK = ac_cv_lbl_unaligned_fail=yes
 ifeq ($(BR2_i386),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+BR2_AC_CV_TRAP_CHECK = ac_cv_lbl_unaligned_fail=no
 endif
 ifeq ($(BR2_x86_64),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+BR2_AC_CV_TRAP_CHECK = ac_cv_lbl_unaligned_fail=no
 endif
 ifeq ($(BR2_m68k),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+BR2_AC_CV_TRAP_CHECK = ac_cv_lbl_unaligned_fail=no
 endif
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+BR2_AC_CV_TRAP_CHECK = ac_cv_lbl_unaligned_fail=no
 endif
 
 ifeq ($(BR2_ENDIAN),"BIG")
-BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=yes
+BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=yes
 else
-BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
+BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=no
 endif
 
-TARGET_CONFIGURE_ARGS= \
+TARGET_CONFIGURE_ARGS = \
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
 	ac_cv_func_memcmp_working=yes \
@@ -347,36 +347,36 @@ TARGET_CONFIGURE_ARGS= \
 ################################################################################
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
-DISABLE_NLS:=
+DISABLE_NLS :=
 else
-DISABLE_NLS:=--disable-nls
+DISABLE_NLS :=--disable-nls
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-DISABLE_LARGEFILE= --disable-largefile
+DISABLE_LARGEFILE = --disable-largefile
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-DISABLE_IPV6= --enable-ipv6
+DISABLE_IPV6 = --enable-ipv6
 else
-DISABLE_IPV6= --disable-ipv6
+DISABLE_IPV6 = --disable-ipv6
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_CONFIGURE_OPTS+=CXX=false
+TARGET_CONFIGURE_OPTS += CXX=false
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-ENABLE_DEBUG:=--enable-debug
+ENABLE_DEBUG := --enable-debug
 else
-ENABLE_DEBUG:=
+ENABLE_DEBUG :=
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_LDFLAGS += --static
 else
-SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
+SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
 include package/pkg-utils.mk
-- 
2.0.2
