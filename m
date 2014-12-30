From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Dec 2014 11:17:03 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141230102545.1CFB6807CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27dd32942e1ee2cdb7a15693fc9dfb2e7fd93e10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in                        |  133 ++++++++++++++--------------
 package/alsamixergui/alsamixergui.mk       |    7 +-
 package/atk/atk.mk                         |   81 +++++++++++------
 package/autoconf/autoconf.mk               |    6 +-
 package/avahi/avahi.mk                     |  117 +++++++++++++------------
 package/bind/bind.mk                       |   11 ++-
 package/cairo/cairo.mk                     |   76 +++++++++++-----
 package/collectd/collectd.mk               |   24 +++--
 package/dbus-glib/dbus-glib.mk             |    7 +-
 package/dropbear/dropbear.mk               |    5 +-
 package/efl/libedje/libedje.mk             |    5 +-
 package/efl/libelementary/libelementary.mk |   10 ++-
 package/efl/libevas/libevas.mk             |   10 ++-
 package/findutils/findutils.mk             |    7 +-
 package/gutenprint/gutenprint.mk           |   56 ++++++------
 package/libenca/libenca.mk                 |    9 +-
 package/libgtk2/libgtk2.mk                 |  110 ++++++++++++-----------
 package/libnss/libnss.mk                   |   29 +++---
 package/libpcap/libpcap.mk                 |    7 +-
 package/libraw/libraw.mk                   |    9 ++-
 package/libungif/libungif.mk               |   11 ++-
 package/linux-firmware/linux-firmware.mk   |   36 +++++---
 package/open2300/open2300.mk               |    5 +-
 package/openpgm/openpgm.mk                 |    6 +-
 package/openpowerlink/openpowerlink.mk     |    7 +-
 package/pango/pango.mk                     |   81 +++++++++++------
 package/pppd/pppd.mk                       |   10 ++-
 package/python-pycrypto/python-pycrypto.mk |    5 +-
 package/rpm/rpm.mk                         |   12 ++-
 package/sdl/sdl.mk                         |   29 ++++---
 package/synergy/synergy.mk                 |   10 ++-
 package/tzdata/tzdata.mk                   |    5 +-
 package/urg/urg.mk                         |    5 +-
 package/vim/vim.mk                         |   22 +++--
 package/wireshark/wireshark.mk             |   16 +++-
 package/x11r7/xapp_xman/xapp_xman.mk       |    9 +-
 36 files changed, 570 insertions(+), 418 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a63a2e8..2055f00 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -246,75 +246,78 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
-TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
-		AR="$(TARGET_AR)" \
-		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD)" \
-		NM="$(TARGET_NM)" \
-		CC="$(TARGET_CC)" \
-		GCC="$(TARGET_CC)" \
-		CPP="$(TARGET_CPP)" \
-		CXX="$(TARGET_CXX)" \
-		FC="$(TARGET_FC)" \
-		RANLIB="$(TARGET_RANLIB)" \
-		READELF="$(TARGET_READELF)" \
-		STRIP="$(TARGET_STRIP)" \
-		OBJCOPY="$(TARGET_OBJCOPY)" \
-		OBJDUMP="$(TARGET_OBJDUMP)" \
-		AR_FOR_BUILD="$(HOSTAR)" \
-		AS_FOR_BUILD="$(HOSTAS)" \
-		CC_FOR_BUILD="$(HOSTCC)" \
-		GCC_FOR_BUILD="$(HOSTCC)" \
-		CXX_FOR_BUILD="$(HOSTCXX)" \
-		FC_FOR_BUILD="$(HOSTFC)" \
-		LD_FOR_BUILD="$(HOSTLD)" \
-		CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
-		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
-		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
-		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
-		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
-		DEFAULT_LINKER="$(TARGET_LD)" \
-		CPPFLAGS="$(TARGET_CPPFLAGS)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		CXXFLAGS="$(TARGET_CXXFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		FCFLAGS="$(TARGET_FCFLAGS)" \
-		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		STAGING_DIR="$(STAGING_DIR)" \
-		INTLTOOL_PERL=$(PERL)
+TARGET_CONFIGURE_OPTS = \
+	PATH=$(BR_PATH) \
+	AR="$(TARGET_AR)" \
+	AS="$(TARGET_AS)" \
+	LD="$(TARGET_LD)" \
+	NM="$(TARGET_NM)" \
+	CC="$(TARGET_CC)" \
+	GCC="$(TARGET_CC)" \
+	CPP="$(TARGET_CPP)" \
+	CXX="$(TARGET_CXX)" \
+	FC="$(TARGET_FC)" \
+	RANLIB="$(TARGET_RANLIB)" \
+	READELF="$(TARGET_READELF)" \
+	STRIP="$(TARGET_STRIP)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	OBJDUMP="$(TARGET_OBJDUMP)" \
+	AR_FOR_BUILD="$(HOSTAR)" \
+	AS_FOR_BUILD="$(HOSTAS)" \
+	CC_FOR_BUILD="$(HOSTCC)" \
+	GCC_FOR_BUILD="$(HOSTCC)" \
+	CXX_FOR_BUILD="$(HOSTCXX)" \
+	FC_FOR_BUILD="$(HOSTFC)" \
+	LD_FOR_BUILD="$(HOSTLD)" \
+	CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
+	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
+	CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
+	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+	FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
+	DEFAULT_ASSEMBLER="$(TARGET_AS)" \
+	DEFAULT_LINKER="$(TARGET_LD)" \
+	CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	FCFLAGS="$(TARGET_FCFLAGS)" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	STAGING_DIR="$(STAGING_DIR)" \
+	INTLTOOL_PERL=$(PERL)
 
 TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
 
-HOST_CONFIGURE_OPTS = PATH=$(BR_PATH) \
-		AR="$(HOSTAR)" \
-		AS="$(HOSTAS)" \
-		LD="$(HOSTLD)" \
-		NM="$(HOSTNM)" \
-		CC="$(HOSTCC)" \
-		GCC="$(HOSTCC)" \
-		CXX="$(HOSTCXX)" \
-		CPP="$(HOSTCPP)" \
-		OBJCOPY="$(HOSTOBJCOPY)" \
-		RANLIB="$(HOSTRANLIB)" \
-		CPPFLAGS="$(HOST_CPPFLAGS)" \
-		CFLAGS="$(HOST_CFLAGS)" \
-		CXXFLAGS="$(HOST_CXXFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_SYSROOT_DIR="/" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
-		INTLTOOL_PERL=$(PERL)
-
-HOST_MAKE_ENV = PATH=$(BR_PATH) \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
-		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_SYSROOT_DIR="/" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+HOST_CONFIGURE_OPTS = \
+	PATH=$(BR_PATH) \
+	AR="$(HOSTAR)" \
+	AS="$(HOSTAS)" \
+	LD="$(HOSTLD)" \
+	NM="$(HOSTNM)" \
+	CC="$(HOSTCC)" \
+	GCC="$(HOSTCC)" \
+	CXX="$(HOSTCXX)" \
+	CPP="$(HOSTCPP)" \
+	OBJCOPY="$(HOSTOBJCOPY)" \
+	RANLIB="$(HOSTRANLIB)" \
+	CPPFLAGS="$(HOST_CPPFLAGS)" \
+	CFLAGS="$(HOST_CFLAGS)" \
+	CXXFLAGS="$(HOST_CXXFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
+	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
+	INTLTOOL_PERL=$(PERL)
+
+HOST_MAKE_ENV = \
+	PATH=$(BR_PATH) \
+	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
 # This is extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 4f21127..dba3ddd 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -9,9 +9,10 @@ ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
 ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
 ALSAMIXERGUI_AUTORECONF = YES
 
-ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
-			ac_cv_lib_fltk_fl_numericsort=yes \
-			ac_cv_lib_asound_snd_ctl_open=yes
+ALSAMIXERGUI_CONF_ENV = \
+	ac_cv_lib_fltk_numericsort=yes \
+	ac_cv_lib_fltk_fl_numericsort=yes \
+	ac_cv_lib_asound_snd_ctl_open=yes
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 95f52c7..2cea550 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -13,33 +13,60 @@ ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
-		glib_cv_stack_grows=no glib_cv_uscore=no \
-		ac_cv_func_strtod=yes ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes \
-		jm_cv_func_gettimeofday_clobber=no gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
-		gl_cv_c_restrict=no ac_cv_prog_F77=no
+ATK_CONF_ENV = \
+	ac_cv_func_posix_getpwuid_r=yes \
+	glib_cv_stack_grows=no \
+	glib_cv_uscore=no \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	ac_cv_func_memcmp_working=yes \
+	ac_cv_have_decl_malloc=yes \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no \
+	ac_cv_prog_F77=no
 
 ATK_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 027f7ac..fd91961 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -11,8 +11,10 @@ AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 AUTOCONF_LICENSE = GPLv3+ with exceptions
 AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
-HOST_AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
-			ac_cv_prog_gnu_m4_gnu=no
+HOST_AUTOCONF_CONF_ENV = \
+	EMACS="no" \
+	ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+	ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index cd25748..10c9915 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -17,55 +17,56 @@ AVAHI_LICENSE = LGPLv2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
-AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		avahi_cv_sys_cxx_works=yes \
-		DATADIRNAME=share
+AVAHI_CONF_ENV = \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	avahi_cv_sys_cxx_works=yes \
+	DATADIRNAME=share
 
 AVAHI_CONF_OPTS = \
 	--disable-qt3 \
@@ -83,7 +84,8 @@ AVAHI_CONF_OPTS = \
 	--with-autoipd-user=avahi \
 	--with-autoipd-group=avahi
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
+AVAHI_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
 	host-pkgconf host-gettext
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
@@ -129,13 +131,14 @@ AVAHI_CONF_OPTS += --disable-gtk3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
-		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
-		am_cv_python_version=$(PYTHON_VERSION) \
-		am_cv_python_platform=linux2 \
-		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-		py_cv_mod_socket_=yes
+AVAHI_CONF_ENV += \
+	am_cv_pathless_PYTHON=python \
+	am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
+	am_cv_python_version=$(PYTHON_VERSION) \
+	am_cv_python_platform=linux2 \
+	am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	py_cv_mod_socket_=yes
 
 AVAHI_DEPENDENCIES += python
 AVAHI_CONF_OPTS += --enable-python
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index cb9a7a2..983fa20 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -18,12 +18,15 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
-BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
-		BUILD_CFLAGS="$(TARGET_CFLAGS)"
+BIND_CONF_ENV = \
+	BUILD_CC="$(TARGET_CC)" \
+	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
 	--with-randomdev=/dev/urandom \
-	--enable-epoll --with-libtool \
-	--with-gssapi=no --enable-rrl
+	--enable-epoll \
+	--with-libtool \
+	--with-gssapi=no \
+	--enable-rrl
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 	BIND_CONF_OPTS += --enable-linux-caps
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index e6fb007..982b7e7 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -12,31 +12,57 @@ CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 CAIRO_AUTORECONF = YES
 
-CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-		glib_cv_uscore=no ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no
+CAIRO_CONF_ENV = \
+	ac_cv_func_posix_getpwuid_r=yes \
+	glib_cv_stack_grows=no \
+	glib_cv_uscore=no \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 	CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index dce2b23..af58aa8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -12,18 +12,21 @@ COLLECTD_LICENSE = GPLv2 LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
-COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
-		gmond hddtemp ipmi ipvs java libvirt lpar lvm madwifi mbmon \
-		modbus multimeter netapp netlink nginx \
-		notify_desktop notify_email numa nut onewire oracle perl pf \
-		pinba postgresql powerdns python redis routeros rrdcached \
-		sigrok tape target_v5upgrade teamspeak2 ted \
-		tokyotyrant uuid varnish vserver write_mongodb write_redis \
-		xmms zfs_arc
+COLLECTD_PLUGINS_DISABLE = \
+	amqp apple_sensors aquaero ascent dbi email \
+	gmond hddtemp ipmi ipvs java libvirt lpar lvm madwifi mbmon \
+	modbus multimeter netapp netlink nginx \
+	notify_desktop notify_email numa nut onewire oracle perl pf \
+	pinba postgresql powerdns python redis routeros rrdcached \
+	sigrok tape target_v5upgrade teamspeak2 ted \
+	tokyotyrant uuid varnish vserver write_mongodb write_redis \
+	xmms zfs_arc
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
-COLLECTD_CONF_OPTS += --with-nan-emulation --with-fp-layout=nothing \
+COLLECTD_CONF_OPTS += \
+	--with-nan-emulation \
+	--with-fp-layout=nothing \
 	--with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
@@ -98,7 +101,8 @@ COLLECTD_CONF_OPTS += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http)
 
-COLLECTD_DEPENDENCIES = host-pkgconf \
+COLLECTD_DEPENDENCIES = \
+	host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index a251b86..ee23a2a 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -10,9 +10,10 @@ DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFLv2.1 GPLv2+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
-DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
-		ac_cv_func_posix_getpwnam_r=yes \
-		have_abstract_sockets=yes
+DBUS_GLIB_CONF_ENV = \
+	ac_cv_have_abstract_sockets=yes \
+	ac_cv_func_posix_getpwnam_r=yes \
+	have_abstract_sockets=yes
 
 DBUS_GLIB_CONF_OPTS = \
 	--disable-tests \
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index c8e9a27..696095d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -8,8 +8,9 @@ DROPBEAR_VERSION = 2014.66
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-DROPBEAR_MAKE = $(MAKE) MULTI=1 SCPPROGRESS=1 \
-		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
+DROPBEAR_MAKE = \
+	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+	PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
 DROPBEAR_LICENSE_FILES = LICENSE
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 9054620..c067a04 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -12,8 +12,9 @@ LIBEDJE_LICENSE_FILES = COPYING
 
 LIBEDJE_INSTALL_STAGING = YES
 
-LIBEDJE_DEPENDENCIES = host-pkgconf lua libeina libeet libecore libevas \
-			libembryo
+LIBEDJE_DEPENDENCIES = \
+	host-pkgconf lua libeina libeet libecore libevas \
+	libembryo
 
 ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
 LIBEDJE_CONF_OPTS += --enable-edje-cc
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 9f3d07a..474e67f 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -12,11 +12,13 @@ LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
-				host-libeet
+LIBELEMENTARY_DEPENDENCIES = \
+	libeina libevas libecore libedje host-libedje \
+	host-libeet
 
-LIBELEMENTARY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
+LIBELEMENTARY_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
 # libethumb_client is only built when ethumbd is built.
 # ethumbd is only built if edbus is built.
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 68647c5..b5a2d72 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -14,8 +14,9 @@ LIBEVAS_INSTALL_STAGING = YES
 
 LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
 
-HOST_LIBEVAS_DEPENDENCIES = host-pkgconf host-zlib host-libeina \
-				host-freetype host-libpng host-libjpeg
+HOST_LIBEVAS_DEPENDENCIES = \
+	host-pkgconf host-zlib host-libeina \
+	host-freetype host-libpng host-libjpeg
 HOST_LIBEVAS_CONF_OPTS += \
 	--enable-image-loader-png \
 	--enable-image-loader-jpeg \
@@ -68,8 +69,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
 LIBEVAS_CONF_OPTS += --enable-gl-xlib
-LIBEVAS_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
-			xlib_libXext libeet
+LIBEVAS_DEPENDENCIES += \
+	xproto_glproto xlib_libX11 xlib_libXrender \
+	xlib_libXext libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 3caedf8..c2c4b39 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -8,8 +8,9 @@ FINDUTILS_VERSION = 4.4.2
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPLv3+
 FINDUTILS_LICENSE_FILES = COPYING
-FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
-			ac_cv_func_working_mktime=yes \
-			gl_cv_func_wcwidth_works=yes
+FINDUTILS_CONF_ENV = \
+	gl_cv_func_stdin=yes \
+	ac_cv_func_working_mktime=yes \
+	gl_cv_func_wcwidth_works=yes
 
 $(eval $(autotools-package))
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index c169922..3ff05b6 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -14,7 +14,8 @@ GUTENPRINT_LICENSE_FILES = COPYING
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
 
-GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
+GUTENPRINT_DEPENDENCIES = \
+	cups host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 # host-gutenprint is needed to generate XML as part of compilation
@@ -22,21 +23,23 @@ GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
 # so we need to build both a host package and a target package
 GUTENPRINT_DEPENDENCIES += host-gutenprint
 
-GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config \
+GUTENPRINT_CONF_ENV = \
+	ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config \
 	ac_cv_path_IJS_CONFIG=""
 
-GUTENPRINT_CONF_OPTS = --disable-libgutenprintui2 \
-                      --disable-samples \
-                      --without-doc \
-                      --without-gimp2 \
-                      --without-foomatic \
-                      --without-foomatic3 \
-                      --disable-escputil \
-                      --disable-test \
-                      --disable-testpattern \
-                      --with-cups="/usr" \
-                      --with-sysroot="$(STAGING_DIR)" \
-                      --disable-cups-ppds
+GUTENPRINT_CONF_OPTS = \
+	--disable-libgutenprintui2 \
+	--disable-samples \
+	--without-doc \
+	--without-gimp2 \
+	--without-foomatic \
+	--without-foomatic3 \
+	--disable-escputil \
+	--disable-test \
+	--disable-testpattern \
+	--with-cups="/usr" \
+	--with-sysroot="$(STAGING_DIR)" \
+	--disable-cups-ppds
 
 # USE_PREGEN_XMLI18N_TMP_H is added by our patch
 GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/usr/include/xmli18n-tmp.h
@@ -53,18 +56,19 @@ HOST_GUTENPRINT_MAKE_ENV =
 # empty string to to disable this, not just to /bin/false like elsewhere.
 HOST_GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=''
 
-HOST_GUTENPRINT_CONF_OPTS = --disable-libgutenprintui2 \
-                           --disable-samples \
-                           --without-gimp2 \
-                           --without-doc \
-                           --disable-nls \
-                           --disable-nls-macos \
-                           --without-foomatic \
-                           --without-foomatic3 \
-                           --disable-escputil \
-                           --disable-test \
-                           --disable-testpattern \
-                           --without-cups
+HOST_GUTENPRINT_CONF_OPTS = \
+	--disable-libgutenprintui2 \
+	--disable-samples \
+	--without-gimp2 \
+	--without-doc \
+	--disable-nls \
+	--disable-nls-macos \
+	--without-foomatic \
+	--without-foomatic3 \
+	--disable-escputil \
+	--disable-test \
+	--disable-testpattern \
+	--without-cups
 
 # Needed by autoreconf
 define GUTENPRINT_CREATE_M4_DIR
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 7ab95f5..184cac9 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -11,10 +11,11 @@ LIBENCA_LICENSE = GPLv2
 LIBENCA_LICENSE_FILES = COPYING
 LIBENCA_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
-			ac_cv_file__dev_urandom=yes \
-			ac_cv_file__dev_arandom=no \
-			ac_cv_file__dev_srandom=no
+LIBENCA_CONF_ENV += \
+	ac_cv_file__dev_random=yes \
+	ac_cv_file__dev_urandom=yes \
+	ac_cv_file__dev_arandom=no \
+	ac_cv_file__dev_srandom=no
 
 define LIBENCA_MAKE_HOST_TOOL
 	$(MAKE) -C $(@D)/tools $(HOST_CONFIGURE_OPTS) make_hash
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 89faca3..eeb56f5 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -16,58 +16,61 @@ LIBGTK2_LICENSE_FILES = COPYING
 
 LIBGTK2_AUTORECONF = YES
 
-LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-		glib_cv_uscore=no \
-		ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
-		ac_cv_prog_F77=no \
-		ac_cv_path_CUPS_CONFIG=no
+LIBGTK2_CONF_ENV = \
+	ac_cv_func_posix_getpwuid_r=yes \
+	glib_cv_stack_grows=no \
+	glib_cv_uscore=no \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no \
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
+	ac_cv_prog_F77=no \
+	ac_cv_path_CUPS_CONFIG=no
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
@@ -79,7 +82,8 @@ LIBGTK2_CONF_OPTS += \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	--with-gdktarget=x11
-LIBGTK2_DEPENDENCIES += xlib_libXcomposite fontconfig xlib_libX11 \
+LIBGTK2_DEPENDENCIES += \
+	xlib_libXcomposite fontconfig xlib_libX11 \
 	xlib_libXext xlib_libXrender
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1737cd4..ea28e5c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,20 +13,21 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPLv2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
-LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
-		NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
-		NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
-		BUILD_OPT=1 \
-		NS_USE_GCC=1 \
-		NSS_USE_SYSTEM_SQLITE=1 \
-		NSS_ENABLE_ECC=1 \
-		NATIVE_CC="$(HOSTCC)" \
-		TARGETCC="$(TARGET_CC)" \
-		TARGETCCC="$(TARGET_CXX)" \
-		TARGETRANLIB="$(TARGET_RANLIB)" \
-		OS_ARCH="Linux" \
-		OS_RELEASE="2.6" \
-		OS_TEST="$(ARCH)"
+LIBNSS_BUILD_VARS = \
+	MOZILLA_CLIENT=1 \
+	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
+	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
+	BUILD_OPT=1 \
+	NS_USE_GCC=1 \
+	NSS_USE_SYSTEM_SQLITE=1 \
+	NSS_ENABLE_ECC=1 \
+	NATIVE_CC="$(HOSTCC)" \
+	TARGETCC="$(TARGET_CC)" \
+	TARGETCCC="$(TARGET_CXX)" \
+	TARGETRANLIB="$(TARGET_RANLIB)" \
+	OS_ARCH="Linux" \
+	OS_RELEASE="2.6" \
+	OS_TEST="$(ARCH)"
 
 ifeq ($(BR2_ARCH_IS_64),y)
 # MIPS64 n32 is treated as a 32-bit architecture by libnss.
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index bcc83ed..bfcf19a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -13,9 +13,10 @@ LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
 
 # We're patching configure.in
 LIBPCAP_AUTORECONF = YES
-LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
-		ac_cv_header_linux_wireless_h=yes \
-		CFLAGS="$(LIBPCAP_CFLAGS)"
+LIBPCAP_CONF_ENV = \
+	ac_cv_linux_vers=2 \
+	ac_cv_header_linux_wireless_h=yes \
+	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 6a2619d..9c3522b 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -8,9 +8,12 @@ LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-LIBRAW_CONF_OPTS += --disable-examples --disable-lcms \
-			--disable-openmp --disable-demosaic-pack-gpl2 \
-			--disable-demosaic-pack-gpl3
+LIBRAW_CONF_OPTS += \
+	--disable-examples \
+	--disable-lcms \
+	--disable-openmp \
+	--disable-demosaic-pack-gpl2 \
+	--disable-demosaic-pack-gpl3
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 9de7ffa..be9f646 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -12,11 +12,12 @@ LIBUNGIF_CONF_OPTS = --without-x
 LIBUNGIF_LICENSE = MIT
 LIBUNGIF_LICENSE_FILES = COPYING
 
-LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
-		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
-		gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
-		gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
-		text2gif
+LIBUNGIF_BINS = \
+	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
+	gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
+	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
+	gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
+	text2gif
 
 define LIBUNGIF_BINS_CLEANUP
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBUNGIF_BINS))
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5b8d214..71c8611 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -47,15 +47,17 @@ endif
 
 # rtl87xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
-LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
+LINUX_FIRMWARE_FILES += \
+	rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin \
 	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtl88xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX),y)
-LINUX_FIRMWARE_FILES += rtlwifi/rtl8821aefw.bin \
-			rtlwifi/rtl8821aefw_wowlan.bin
+LINUX_FIRMWARE_FILES += \
+	rtlwifi/rtl8821aefw.bin \
+	rtlwifi/rtl8821aefw_wowlan.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
@@ -241,12 +243,14 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
-LINUX_FIRMWARE_FILES += dvb-fe-xc4000-1.4.1.fw \
-			dvb-fe-xc5000-1.6.114.fw \
-			dvb-fe-xc5000c-4.1.30.7.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc4000 \
-				    LICENCE.xc5000 \
-				    LICENCE.xc5000c
+LINUX_FIRMWARE_FILES += \
+	dvb-fe-xc4000-1.4.1.fw \
+	dvb-fe-xc5000-1.6.114.fw \
+	dvb-fe-xc5000c-4.1.30.7.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENCE.xc4000 \
+	LICENCE.xc5000 \
+	LICENCE.xc5000c
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AS102),y)
@@ -272,17 +276,19 @@ endif
 
 # brcm43xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
-LINUX_FIRMWARE_FILES += brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
-			brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
-			brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
-			brcm/brcmfmac4335-sdio.bin
+LINUX_FIRMWARE_FILES += \
+	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
+	brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
+	brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
+	brcm/brcmfmac4335-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm43xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
-LINUX_FIRMWARE_FILES += brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
-			brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43362-sdio.bin
+LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
+	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43362-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index db848b9..db91e50 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -10,8 +10,9 @@ OPEN2300_VERSION = 12
 OPEN2300_LICENSE = GPLv2
 OPEN2300_LICENSE_FILES = COPYING
 
-OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
-		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
+OPEN2300_BINS = \
+	open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
+	histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
 OPEN2300_CFLAGS = $(TARGET_CFLAGS)
 OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index f8a8506..d54e8eb 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -13,7 +13,9 @@ OPENPGM_INSTALL_STAGING = YES
 OPENPGM_AUTORECONF = YES
 OPENPGM_SUBDIR = openpgm/pgm/
 OPENPGM_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
-OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
-                   ac_cv_file__dev_hpet=no
+OPENPGM_CONF_ENV = \
+	ac_cv_file__proc_cpuinfo=yes \
+	ac_cv_file__dev_rtc=no \
+	ac_cv_file__dev_hpet=no
 
 $(eval $(autotools-package))
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 31c533e..d9cdcdd 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -19,9 +19,10 @@ OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
 OPENPOWERLINK_DEPENDENCIES = libpcap
 else
 # use the kernel stack
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=ON \
-		-DCFG_KERNEL_DIR=$(LINUX_DIR) \
-		-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_KERNEL_STACK=ON \
+	-DCFG_KERNEL_DIR=$(LINUX_DIR) \
+	-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
 OPENPOWERLINK_DEPENDENCIES = linux
 endif
 
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 63cfae3..f3e16ef 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -13,36 +13,63 @@ PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPLv2+
 PANGO_LICENSE_FILES = COPYING
 
-PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-		glib_cv_uscore=no ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+PANGO_CONF_ENV = \
+	ac_cv_func_posix_getpwuid_r=yes \
+	glib_cv_stack_grows=no \
+	glib_cv_uscore=no \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no \
+	ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 PANGO_CONF_OPTS = --enable-explicit-deps=no --disable-gtk-doc-html
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+PANGO_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkgconf \
 	libglib2 \
 	cairo \
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0a88251..453445b 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -8,14 +8,16 @@ PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
-PPPD_LICENSE_FILES = pppd/tdb.c pppd/plugins/pppoatm/COPYING \
+PPPD_LICENSE_FILES = \
+	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
 PPPD_INSTALL_STAGING = YES
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
-PPPD_RADIUS_CONF = dictionary dictionary.ascend dictionary.compat \
-			dictionary.merit dictionary.microsoft \
-			issue port-id-map realms server radiusclient.conf
+PPPD_RADIUS_CONF = \
+	dictionary dictionary.ascend dictionary.compat \
+	dictionary.merit dictionary.microsoft \
+	issue port-id-map realms server radiusclient.conf
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 	PPPD_DEPENDENCIES += libpcap
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index f872ccc..bb69f41 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -10,8 +10,9 @@ PYTHON_PYCRYPTO_SITE = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
 PYTHON_PYCRYPTO_SETUP_TYPE = distutils
 
 PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
-PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
-		LEGAL/copy/LICENSE.python-2.2
+PYTHON_PYCRYPTO_LICENSE_FILES = \
+	COPYRIGHT LEGAL/copy/LICENSE.libtom \
+	LEGAL/copy/LICENSE.python-2.2
 
 # The pycrypto package contains a LICENSE.orig file, but our patching
 # infrastrucure removes all .orig file, so we must rename that license
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 50e6d75..c4215b5 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -11,12 +11,16 @@ RPM_DEPENDENCIES = zlib beecrypt neon popt openssl
 RPM_LICENSE = LGPLv2.1
 RPM_LICENSE_FILES = COPYING.LIB
 
-RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
-		ac_cv_va_copy=yes
+RPM_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
+	ac_cv_va_copy=yes
 
-RPM_CONF_OPTS = --disable-build-versionscript --disable-rpath \
+RPM_CONF_OPTS = \
+	--disable-build-versionscript \
+	--disable-rpath \
 	--without-selinux \
-	--without-python --without-perl \
+	--without-python \
+	--without-perl \
 	--with-openssl=external \
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index d3fc232..05d9a54 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -46,7 +46,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPTS += --enable-video-x11=yes
-SDL_DEPENDENCIES += xlib_libX11 xlib_libXext \
+SDL_DEPENDENCIES += \
+	xlib_libX11 xlib_libXext \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
 else
@@ -69,18 +70,20 @@ ifeq ($(BR2_PACKAGE_MESA3D),y)
 SDL_DEPENDENCIES += mesa3d
 endif
 
-SDL_CONF_OPTS += --enable-pulseaudio=no \
-		--disable-arts \
-		--disable-esd \
-		--disable-nasm \
-		--disable-video-ps3
-
-HOST_SDL_CONF_OPTS += --enable-pulseaudio=no \
-		--enable-video-x11=no \
-		--disable-arts \
-		--disable-esd \
-		--disable-nasm \
-		--disable-video-ps3
+SDL_CONF_OPTS += \
+	--enable-pulseaudio=no \
+	--disable-arts \
+	--disable-esd \
+	--disable-nasm \
+	--disable-video-ps3
+
+HOST_SDL_CONF_OPTS += \
+	--enable-pulseaudio=no \
+	--enable-video-x11=no \
+	--disable-arts \
+	--disable-esd \
+	--disable-nasm \
+	--disable-video-ps3
 
 SDL_CONFIG_SCRIPTS = sdl-config
 
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index d2e5a38..7b52085 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -7,10 +7,12 @@
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
 SYNERGY_AUTORECONF = YES
-SYNERGY_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
-                   --x-libraries=$(STAGING_DIR)/usr/lib
-SYNERGY_DEPENDENCIES = xlib_libXtst \
-		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
+SYNERGY_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+SYNERGY_DEPENDENCIES = \
+	xlib_libXtst \
+	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
 SYNERGY_LICENSE = GPLv2
 SYNERGY_LICENSE_FILES = COPYING
 
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index d0aa857..d869eda 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -11,8 +11,9 @@ TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
 
-TZDATA_DEFAULT_ZONELIST = africa antarctica asia australasia backward etcetera \
-			europe factory northamerica pacificnew southamerica
+TZDATA_DEFAULT_ZONELIST = \
+	africa antarctica asia australasia backward etcetera \
+	europe factory northamerica pacificnew southamerica
 
 ifeq ($(call qstrip,$(BR2_TARGET_TZ_ZONELIST)),default)
 TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index f831f74..41ac4f4 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -14,8 +14,9 @@ URG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL_NET),yy)
 URG_DEPENDENCIES += sdl sdl_net
-URG_CONF_OPTS += --with-sdl-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+URG_CONF_OPTS += \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 else
 URG_CONF_OPTS = --without-sdl
 URG_CONF_ENV += ac_cv_path_SDL_CONFIG=""
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7a07ef8..01ba27e 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -9,18 +9,20 @@ VIM_SITE_METHOD = hg
 # 7.4 release patchlevel 333
 VIM_VERSION = 8ae50e3ef8bf
 # Win over busybox vi since vim is more feature-rich
-VIM_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+VIM_DEPENDENCIES = \
+	ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 VIM_SUBDIR = src
-VIM_CONF_ENV = vim_cv_toupper_broken=no \
-		vim_cv_terminfo=yes \
-		vim_cv_tty_group=world \
-		vim_cv_tty_mode=0620 \
-		vim_cv_getcwd_broken=no \
-		vim_cv_stat_ignores_slash=yes \
-		vim_cv_memmove_handles_overlap=yes \
-		ac_cv_sizeof_int=4 \
-		ac_cv_small_wchar_t=no
+VIM_CONF_ENV = \
+	vim_cv_toupper_broken=no \
+	vim_cv_terminfo=yes \
+	vim_cv_tty_group=world \
+	vim_cv_tty_mode=0620 \
+	vim_cv_getcwd_broken=no \
+	vim_cv_stat_ignores_slash=yes \
+	vim_cv_memmove_handles_overlap=yes \
+	ac_cv_sizeof_int=4 \
+	ac_cv_small_wchar_t=no
 # GUI/X11 headers leak from the host so forcibly disable them
 VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 095050a..ae69006 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -12,13 +12,19 @@ WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
 # For wrong cflags patch
 WIRESHARK_AUTORECONF = YES
-WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-			ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+WIRESHARK_CONF_ENV = \
+	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
 # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
 # Work around it by pointing includedir at staging
-WIRESHARK_CONF_OPTS = --disable-wireshark --without-krb5 --disable-usr-local \
-		     --enable-static=no --with-gnutls=no --with-libsmi=no \
-		     --includedir=$(STAGING_DIR)/usr/include
+WIRESHARK_CONF_OPTS = \
+	--disable-wireshark \
+	--without-krb5 \
+	--disable-usr-local \
+	--enable-static=no \
+	--with-gnutls=no \
+	--with-libsmi=no \
+	--includedir=$(STAGING_DIR)/usr/include
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 7b3fbd5..44f01b1 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -11,9 +11,10 @@ XAPP_XMAN_LICENSE = MIT
 XAPP_XMAN_LICENSE_FILES = COPYING
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
-XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
-		ac_cv_file__etc_man_config=no \
-		ac_cv_file__etc_manpath_config=no \
-		ac_cv_file__usr_share_misc_man_conf=no
+XAPP_XMAN_CONF_ENV = \
+	ac_cv_file__etc_man_conf=no \
+	ac_cv_file__etc_man_config=no \
+	ac_cv_file__etc_manpath_config=no \
+	ac_cv_file__usr_share_misc_man_conf=no
 
 $(eval $(autotools-package))
