From: Abdoulaye Walsimou Gaye <walsimou@walsimou.com>
Date: Wed,  6 May 2009 13:15:50 +0200
Subject: [Buildroot] [PATCH, RFC]: Allow cloning a git branch of uClibc
Message-ID: <1241608550-17668-1-git-send-email-walsimou@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to clone a branch of uClibc git repository (instead of a
release or snapshot source).

Signed-off-by: Abdoulaye Walsimou Gaye <walsimou@walsimou.com>
---
 toolchain/uClibc/Config.in         |   10 ++
 toolchain/uClibc/uClibc-git.config |  229 ++++++++++++++++++++++++++++++++++++
 toolchain/uClibc/uclibc.mk         |   27 ++++-
 3 files changed, 265 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-git.config

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index b7678a3..5cfa0e7 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -31,6 +31,9 @@ choice
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
+	config BR2_UCLIBC_VERSION_GIT
+		bool "branch you wish"
+
 endchoice
 
 
@@ -48,6 +51,12 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
+	default git		if BR2_UCLIBC_VERSION_GIT
+
+config BR2_UCLIBC_GIT_BRANCH
+	depends on  BR2_UCLIBC_VERSION_GIT
+	string "which branch of uClibc to checkout"
+	default "master"
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
@@ -56,6 +65,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
+	default "toolchain/uClibc/uClibc-git.config" if BR2_UCLIBC_VERSION_GIT
 	help
 	  Some people may wish to use their own modified uClibc configuration
 	  file and will specify their config file location with this option.
diff --git a/toolchain/uClibc/uClibc-git.config b/toolchain/uClibc/uClibc-git.config
new file mode 100644
index 0000000..3e84d39
--- /dev/null
+++ b/toolchain/uClibc/uClibc-git.config
@@ -0,0 +1,229 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.30-svn
+# Tue May  5 20:03:12 2009
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="none"
+FORCE_OPTIONS_FOR_ARCH=y
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+# ARCH_LITTLE_ENDIAN is not set
+# ARCH_BIG_ENDIAN is not set
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+DOPIC=y
+# ARCH_HAS_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+LDSO_CACHE_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+LDSO_BASE_FILENAME="ld.so"
+UCLIBC_STATIC_LDCONFIG=y
+LDSO_RUNPATH=y
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+LINUXTHREADS_OLD=y
+# UCLIBC_HAS_THREADS_NATIVE is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+# MALLOC_GLIBC_COMPAT is not set
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+# UCLIBC_SUSV4_LEGACY is not set
+# UCLIBC_HAS_STUBS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
+UNIX98PTY_ONLY=y
+# UCLIBC_HAS_GETPT is not set
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Support various families of functions
+#
+UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_XATTR=y
+UCLIBC_HAS_PROFILING=y
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_HAS_COMPAT_RES_STATE=y
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+UCLIBC_HAS_CTYPE_UNSAFE=y
+# UCLIBC_HAS_CTYPE_CHECKED is not set
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_PRINTF is not set
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
+# UCLIBC_HAS_PRINTF_M_SPEC is not set
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
+# UCLIBC_HAS_WORDEXP is not set
+# UCLIBC_HAS_FTW is not set
+UCLIBC_HAS_GLOB=y
+# UCLIBC_HAS_GNU_GLOB is not set
+
+#
+# Library Installation Options
+#
+SHARED_LIB_LOADER_PREFIX="$(RUNTIME_PREFIX)lib"
+RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
+DEVEL_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/usr/"
+HARDWIRED_ABSPATH=y
+
+#
+# Security options
+#
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+UCLIBC_BUILD_RELRO=y
+# UCLIBC_BUILD_NOW is not set
+UCLIBC_BUILD_NOEXECSTACK=y
+UCLIBC_BUILD_PIE=n
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index b39b939..8a1df96 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -21,6 +21,10 @@ UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
+else ifeq ($(BR2_UCLIBC_VERSION_GIT),y)
+UCLIBC_GIT_BRANCH:=$(strip $(subst ",, $(BR2_UCLIBC_GIT_BRANCH)))
+UCLIBC_SITE:=git://git.busybox.net/uClibc.git
+UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_GIT_BRANCH).git
 else
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 UCLIBC_SITE:=http://www.uclibc.org/downloads
@@ -35,7 +39,11 @@ else
 UCLIBC_PATCH_DIR:=toolchain/uClibc/ext_source/$(VENDOR_PATCH_DIR)/$(UCLIBC_OFFICIAL_VERSION)
 endif
 
+ifeq ($(BR2_UCLIBC_VERSION_GIT),y)
+UCLIBC_SOURCE:=uClibc-$(UCLIBC_GIT_BRANCH).git.tar.bz2
+else
 UCLIBC_SOURCE:=uClibc-$(UCLIBC_OFFICIAL_VERSION).tar.bz2
+endif
 
 UCLIBC_CAT:=$(BZCAT)
 
@@ -80,8 +88,25 @@ UCLIBC_ARM_TYPE:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
 UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(strip $(subst ",, $(BR2_SPARC_TYPE)))
 #"))
 
+
+ifeq ($(BR2_UCLIBC_VERSION_GIT),y)
+UCLIBC_GIT_CMD:=$(strip $(subst ",, $(BR2_GIT)))
+define UCLIBC_SOURCE_DOWNLOADER
+	$(Q)test -e $(DL_DIR)/$(UCLIBC_SOURCE) || \
+	$(UCLIBC_GIT_CMD) $(UCLIBC_SITE) uClibc-$(UCLIBC_GIT_BRANCH).git; \
+	cd uClibc-$(UCLIBC_GIT_BRANCH).git; \
+	git checkout -b uClibc-$(UCLIBC_GIT_BRANCH) origin/$(UCLIBC_GIT_BRANCH); \
+	cd ..; \
+	tar cjvf $(UCLIBC_SOURCE) uClibc-$(UCLIBC_GIT_BRANCH).git; \
+	rm -rf uClibc-$(UCLIBC_GIT_BRANCH).git; \
+	mv $(UCLIBC_SOURCE) $(DL_DIR)
+endef
+else
+UCLIBC_SOURCE_DOWNLOADER=DOWNLOAD
+endif
+
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
+	$(call UCLIBC_SOURCE_DOWNLOADER,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
 
 ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
 UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
-- 
1.6.0.4
