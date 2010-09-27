From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Sep 2010 15:33:07 +0200
Subject: [Buildroot] [PATCH 2/2] packages: remove unneeded
	_INSTALL_TARGET_OPT definitions
In-Reply-To: <cover.1285594377.git.thomas.petazzoni@free-electrons.com>
References: <cover.1285594377.git.thomas.petazzoni@free-electrons.com>
Message-ID: <478ea1a12dffca0025c0ad55ad702cbaec465f93.1285594377.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that <pkg>_INSTALL_TARGET_OPT always defaults to
'DESTDIR=$(TARGET_DIR) install', we can remove the
<pkg>_INSTALL_TARGET_OPT definition from a lot of packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/argus.mk                             |    1 -
 package/at/at.mk                                   |    2 --
 package/autoconf/autoconf.mk                       |    4 ----
 package/automake/automake.mk                       |    4 ----
 package/beecrypt/beecrypt.mk                       |    2 --
 package/bind/bind.mk                               |    1 -
 package/bmon/bmon.mk                               |    1 -
 package/bootutils/bootutils.mk                     |    2 --
 package/bridge-utils/bridge.mk                     |    1 -
 package/dbus/dbus.mk                               |    7 -------
 package/expat/expat.mk                             |    1 -
 package/freetype/freetype.mk                       |    1 -
 package/gamin/gamin.mk                             |    2 --
 package/gperf/gperf.mk                             |    3 ---
 package/gtk2-themes/gtk2_themes.mk                 |    1 -
 package/gtkperf/gtkperf.mk                         |    1 -
 package/gvfs/gvfs.mk                               |    1 -
 package/haserl/haserl.mk                           |    3 ---
 package/java/classpath/classpath.mk                |    2 --
 package/java/jamvm/jamvm.mk                        |    1 -
 package/jpeg/jpeg.mk                               |    1 -
 package/kexec/kexec.mk                             |    2 --
 package/libcgi/libcgi.mk                           |    1 -
 package/libiconv/libiconv.mk                       |    2 --
 package/libnl/libnl.mk                             |    1 -
 package/libtool/libtool.mk                         |    4 ----
 package/m4/m4.mk                                   |    4 ----
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 --
 package/multimedia/ffmpeg/ffmpeg.mk                |    3 ---
 package/neon/neon.mk                               |    1 -
 package/netsnmp/netsnmp.mk                         |    1 -
 package/ng-spice-rework/ng-spice-rework.mk         |    1 -
 package/openntpd/openntpd.mk                       |    1 -
 package/openssh/openssh.mk                         |    2 --
 package/patch/patch.mk                             |    1 -
 package/pkg-config/pkg-config.mk                   |    4 ----
 package/rdesktop/rdesktop.mk                       |    2 --
 package/ruby/ruby.mk                               |    1 -
 package/sawman/sawman.mk                           |    5 -----
 package/setserial/setserial.mk                     |    1 -
 package/sqlite/sqlite.mk                           |    1 -
 package/sylpheed/sylpheed.mk                       |    1 -
 package/tcpdump/tcpdump.mk                         |    2 --
 package/udpcast/udpcast.mk                         |    1 -
 package/vtun/vtun.mk                               |    1 -
 package/wpa_supplicant/wpa_supplicant.mk           |    1 -
 package/x11r7/mesa3d/mesa3d.mk                     |    1 -
 .../xdriver_xf86-input-acecad.mk                   |    1 -
 .../xdriver_xf86-input-aiptek.mk                   |    1 -
 .../xdriver_xf86-input-evdev.mk                    |    1 -
 .../xdriver_xf86-input-joystick.mk                 |    1 -
 .../xdriver_xf86-input-keyboard.mk                 |    1 -
 .../xdriver_xf86-input-mouse.mk                    |    1 -
 .../xdriver_xf86-input-synaptics.mk                |    1 -
 .../xdriver_xf86-input-vmmouse.mk                  |    1 -
 .../xdriver_xf86-input-void.mk                     |    1 -
 .../xdriver_xf86-video-apm.mk                      |    1 -
 .../xdriver_xf86-video-ark.mk                      |    1 -
 .../xdriver_xf86-video-ast.mk                      |    1 -
 .../xdriver_xf86-video-ati.mk                      |    1 -
 .../xdriver_xf86-video-chips.mk                    |    1 -
 .../xdriver_xf86-video-cirrus.mk                   |    1 -
 .../xdriver_xf86-video-dummy.mk                    |    1 -
 .../xdriver_xf86-video-fbdev.mk                    |    1 -
 .../xdriver_xf86-video-geode.mk                    |    1 -
 .../xdriver_xf86-video-glide.mk                    |    1 -
 .../xdriver_xf86-video-glint.mk                    |    1 -
 .../xdriver_xf86-video-i128.mk                     |    1 -
 .../xdriver_xf86-video-i740.mk                     |    1 -
 .../xdriver_xf86-video-intel.mk                    |    1 -
 .../xdriver_xf86-video-mach64.mk                   |    1 -
 .../xdriver_xf86-video-mga.mk                      |    1 -
 .../xdriver_xf86-video-neomagic.mk                 |    1 -
 .../xdriver_xf86-video-newport.mk                  |    1 -
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    1 -
 .../xdriver_xf86-video-openchrome.mk               |    1 -
 .../xdriver_xf86-video-r128.mk                     |    1 -
 .../xdriver_xf86-video-rendition.mk                |    1 -
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    1 -
 .../xdriver_xf86-video-s3virge.mk                  |    1 -
 .../xdriver_xf86-video-savage.mk                   |    1 -
 .../xdriver_xf86-video-siliconmotion.mk            |    1 -
 .../xdriver_xf86-video-sis.mk                      |    1 -
 .../xdriver_xf86-video-sisusb.mk                   |    1 -
 .../xdriver_xf86-video-suncg14.mk                  |    1 -
 .../xdriver_xf86-video-suncg3.mk                   |    1 -
 .../xdriver_xf86-video-suncg6.mk                   |    1 -
 .../xdriver_xf86-video-sunffb.mk                   |    1 -
 .../xdriver_xf86-video-sunleo.mk                   |    1 -
 .../xdriver_xf86-video-suntcx.mk                   |    1 -
 .../xdriver_xf86-video-tdfx.mk                     |    1 -
 .../xdriver_xf86-video-tga.mk                      |    1 -
 .../xdriver_xf86-video-trident.mk                  |    1 -
 .../xdriver_xf86-video-tseng.mk                    |    1 -
 .../xdriver_xf86-video-v4l.mk                      |    1 -
 .../xdriver_xf86-video-vesa.mk                     |    1 -
 .../xdriver_xf86-video-vmware.mk                   |    1 -
 .../xdriver_xf86-video-voodoo.mk                   |    1 -
 .../xdriver_xf86-video-wsfb.mk                     |    1 -
 .../xdriver_xf86-video-xgi.mk                      |    1 -
 .../xdriver_xf86-video-xgixp.mk                    |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 -
 package/xstroke/xstroke.mk                         |    1 -
 package/xvkbd/xvkbd.mk                             |    2 --
 104 files changed, 0 insertions(+), 147 deletions(-)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 6653d06..2705bac 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -8,7 +8,6 @@ ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
 ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
 ARGUS_DEPENDENCIES=libpcap
-ARGUS_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
 define ARGUS_DEBIAN_PATCH_APPLY
 	if [ -d $(@D)/debian/patches ]; then \
diff --git a/package/at/at.mk b/package/at/at.mk
index 3799790..c38c424 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -9,8 +9,6 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 AT_AUTORECONF = YES
 AT_INSTALL_STAGING = NO
 AT_INSTALL_TARGET = YES
-# no install-strip / install-exec
-AT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8794466..a21192f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -7,10 +7,6 @@ AUTOCONF_VERSION = 2.65
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-AUTOCONF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 46bb773..a33c9f4 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -7,10 +7,6 @@ AUTOMAKE_VERSION = 1.10
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-AUTOMAKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index d26d31d..5fffd1f 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -13,6 +13,4 @@ BEECRYPT_CONF_OPT =  --without-cplusplus \
 		--without-python  \
 		--disable-rpath
 
-BEECRYPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
-
 $(eval $(call AUTOTARGETS,package,beecrypt))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8e4867a..2434086 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -8,7 +8,6 @@ BIND_VERSION = 9.5.2-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
 BIND_INSTALL_STAGING = NO
-BIND_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
 BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen
 BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 5036185..e9b10b0 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -8,7 +8,6 @@ BMON_VERSION = 2.1.0
 BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
 BMON_SITE = http://distfiles.gentoo.org/distfiles
 BMON_DEPENDENCIES = ncurses
-BMON_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index dd22479..d574812 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -8,6 +8,4 @@ BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
-BOOTUTILS_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
-
 $(eval $(call AUTOTARGETS,package,bootutils))
diff --git a/package/bridge-utils/bridge.mk b/package/bridge-utils/bridge.mk
index 1d633dd..f8736b1 100644
--- a/package/bridge-utils/bridge.mk
+++ b/package/bridge-utils/bridge.mk
@@ -10,7 +10,6 @@ BRIDGE_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/brid
 BRIDGE_AUTORECONF:=YES
 BRIDGE_INSTALL_STAGING:=NO
 BRIDGE_INSTALL_TARGET:=YES
-BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
 BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR)
 
 define BRIDGE_UNINSTALL_TARGET_CMDS
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 546cb69..1820286 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -9,13 +9,6 @@ DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
-ifeq ($(BR2_ENABLE_DEBUG),y)
-# install-exec doesn't install the config file
-DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-else
-# install-strip uses host strip
-DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip STRIPPROG="$(STRIPCMD)"
-endif
 
 DBUS_DEPENDENCIES = host-pkg-config
 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5d68e36..f82a904 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -10,7 +10,6 @@ EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/exp
 EXPAT_LIBTOOL_PATCH = NO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_TARGET = YES
-# no install-strip / install-exec
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5a88cca..a2df1d8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,7 +9,6 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
-FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 1aa5f8b..db27692 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -15,8 +15,6 @@ GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 # python support broken
 GAMIN_CONF_OPT += --without-python
 
-GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 GAMIN_CONF_ENV = have_abstract_sockets=no
 
 ifneq ($(BR2_LARGEFILE),y)
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 89f355b..f48ba9f 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -10,8 +10,5 @@ GPERF_AUTORECONF = NO
 GPERF_INSTALL_STAGING = NO
 GPERF_INSTALL_TARGET = YES
 
-# install-strip rule does not exist in gperf's makefiles
-GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 $(eval $(call AUTOTARGETS,package,gperf))
 $(eval $(call AUTOTARGETS,package,gperf,host))
diff --git a/package/gtk2-themes/gtk2_themes.mk b/package/gtk2-themes/gtk2_themes.mk
index 1d2e7ce..8dc8af4 100644
--- a/package/gtk2-themes/gtk2_themes.mk
+++ b/package/gtk2-themes/gtk2_themes.mk
@@ -8,7 +8,6 @@ GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar
 GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
 GTK2_THEME_HICOLOR_INSTALL_STAGING = NO
 GTK2_THEME_HICOLOR_INSTALL_TARGET = YES
-GTK2_THEME_HICOLOR_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
         --build=$(GNU_HOST_NAME) --prefix=/usr \
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 010a6a0..8d314ee 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -7,7 +7,6 @@ GTKPERF_VERSION:=0.40
 GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
 GTKPERF_INSTALL_TARGET = YES
-GTKPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 GTKPERF_DEPENDENCIES = libgtk2
 
 $(eval $(call AUTOTARGETS,package,gtkperf))
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 7638f54..d71a2a8 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -10,7 +10,6 @@ GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
-GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 GVFS_AUTORECONF = NO
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
 GVFS_LIBTOOL_PATCH = NO
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 53b5548..79f0241 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -8,9 +8,6 @@ HASERL_VERSION:=$(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 HASERL_AUTORECONF:=NO
 HASERL_INSTALL_TARGET:=YES
-ifeq ($(BR2_ENABLE_DEBUG),)
-HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
-endif
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 979cc74..338cf01 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -9,8 +9,6 @@ CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
 CLASSPATH_AUTORECONF = NO
 CLASSPATH_INSTALL_STAGING = YES
 CLASSPATH_INSTALL_TARGET = YES
-CLASSPATH_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
-CLASSPATH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 CLASSPATH_DIR_PREFIX = package/java
 
 CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index c7f7eac..e7796bb 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -9,7 +9,6 @@ JAMVM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/jam
 JAMVM_AUTORECONF = NO
 JAMVM_INSTALL_STAGING = YES
 JAMVM_INSTALL_TARGET = YES
-JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 9a4512c..4f08534 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -25,7 +25,6 @@ JPEG_SITE:=ftp://ftp.uu.net/graphics/jpeg/
 JPEG_SOURCE=jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
-JPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 JPEG_LIBTOOL_PATCH = NO
 JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 5081ee8..417e94e 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -6,8 +6,6 @@
 KEXEC_VERSION = 2.0.1
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
-# no install-strip/install-exec
-KEXEC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 85f35a2..8e8bbeb 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -7,6 +7,5 @@ LIBCGI_VERSION:=1.0
 LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 LIBCGI_INSTALL_STAGING=YES
-LIBCGI_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,libcgi))
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index c56a986..27977a8 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -10,8 +10,6 @@ LIBICONV_AUTORECONF = NO
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_INSTALL_TARGET = YES
 
-LIBICONV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 # Remove not used preloadable libiconv.so
 define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index ccedd22..54b9ff2 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -8,7 +8,6 @@ LIBNL_VERSION = 1.1
 LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://distfiles.gentoo.org/distfiles
 LIBNL_INSTALL_STAGING = YES
-LIBNL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4278029..a996876 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,10 +7,6 @@ LIBTOOL_VERSION = 1.5.24
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-LIBTOOL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 define HOST_LIBTOOL_CUSTOM_INSTALL
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index a0b56c4..7f2e333 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,10 +7,6 @@ M4_VERSION = 1.4.9
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # no install-exec
-M4_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index c1a2b1a..5447b6c 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -44,8 +44,6 @@ ALSA_LIB_CONF_OPT += --disable-old-symbols
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-# install-exec doesn't install the config files
-ALSA_LIB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 ALSA_LIB_CONF_OPT += --enable-debug
 endif
 
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index aac39c1..4e6924c 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -134,7 +134,4 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
-# Override FFMPEG_INSTALL_TARGET_OPT: FFmpeg does not support install-strip
-FFMPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 $(eval $(call AUTOTARGETS,package/multimedia,ffmpeg))
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 285d49f..c570fc1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,7 +6,6 @@
 NEON_VERSION:=0.28.3
 NEON_SITE:=http://www.webdav.org/neon/
 NEON_INSTALL_STAGING:=YES
-NEON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
 NEON_CONF_OPT:=--enable-shared --without-gssapi --disable-rpath
 
 NEON_DEPENDENCIES:=host-pkg-config
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 7c9367a..47c792f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -8,7 +8,6 @@ NETSNMP_VERSION = 5.5
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 NETSNMP_LIBTOOL_PATCH = NO
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
diff --git a/package/ng-spice-rework/ng-spice-rework.mk b/package/ng-spice-rework/ng-spice-rework.mk
index 5f9c5b8..7515d25 100644
--- a/package/ng-spice-rework/ng-spice-rework.mk
+++ b/package/ng-spice-rework/ng-spice-rework.mk
@@ -9,7 +9,6 @@ NG_SPICE_REWORK_SITE = http://superb-west.dl.sourceforge.net/sourceforge/ngspice
 NG_SPICE_REWORK_AUTORECONF = NO
 NG_SPICE_REWORK_INSTALL_STAGING = NO
 NG_SPICE_REWORK_INSTALL_TARGET = YES
-NG_SPICE_REWORK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
 # the above doesn't work with shared config.cache
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 81b268b..3555ffa 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -7,7 +7,6 @@
 OPENNTPD_VERSION = 3.9p1
 OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
-OPENNTPD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/ntpd
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 17044cc..988815a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -10,8 +10,6 @@ OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --without-x
 
-OPENSSH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 OPENSSH_DEPENDENCIES = zlib openssl
 
 define OPENSSH_INSTALL_INITSCRIPT
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 31de4bb..80d9db1 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -6,6 +6,5 @@
 PATCH_VERSION:=2.6
 PATCH_SOURCE:=patch_$(PATCH_VERSION).orig.tar.gz
 PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/patch
-PATCH_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,patch))
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 7caf37b..330b166 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -7,10 +7,6 @@ PKG_CONFIG_VERSION = 0.23
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 
-ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-endif
-
 PKG_CONFIG_DEPENDENCIES = libglib2
 
 PKG_CONFIG_CONF_OPT = --with-installed-glib
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index e241210..a55d58f 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -7,8 +7,6 @@
 RDESKTOP_VERSION = 1.5.0
 RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
 RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
-# no install-strip / install-exec
-RDESKTOP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 07e5472..309a69d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -8,7 +8,6 @@ RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
 RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_AUTORECONF=YES
 RUBY_DEPENDENCIES=host-ruby
-RUBY_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 RUBY_MAKE_ENV=$(TARGET_MAKE_ENV)
 
 RUBY_CONF_OPT = --disable-install-doc
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 1b53ea9..c9ec06d 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -9,11 +9,6 @@ SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_INSTALL_TARGET = YES
 # SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
-ifeq ($(BR2_ENABLE_DEBUG),y)
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-else
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
-endif
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS,package,sawman))
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 0b67346..f24af73 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -7,7 +7,6 @@ SETSERIAL_VERSION            = 2.17
 SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
 SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
-SETSERIAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c7d0731..cc74fd7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -8,7 +8,6 @@ SQLITE_VERSION = 3.6.23.1
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-SQLITE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 SQLITE_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index bc2872d..f1e4fa4 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,7 +9,6 @@ SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v2.4
 SYLPHEED_AUTORECONF = NO
 SYLPHEED_INSTALL_STAGING = NO
 SYLPHEED_INSTALL_TARGET = YES
-SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 0b9236d..b5e55df 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -9,8 +9,6 @@
 TCPDUMP_VERSION:=4.0.0
 TCPDUMP_SITE:=http://www.tcpdump.org/release
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VERSION).tar.gz
-# no install-strip/install-exec
-TCPDUMP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" install
 TCPDUMP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
 TCPDUMP_CONF_OPT:=--without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index d55724c..8672dd5 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -6,7 +6,6 @@
 UDPCAST_VERSION:=20071228
 UDPCAST_SOURCE:=udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE:=http://www.udpcast.linux.lu/download
-UDPCAST_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
 define UDPCAST_REMOVE_UDP_SENDER
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 0990820..78ea44f 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -9,7 +9,6 @@
 VTUN_VERSION:=3.0.2
 VTUN_SOURCE:=vtun-$(VTUN_VERSION).tar.gz
 VTUN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/vtun/
-VTUN_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 VTUN_DEPENDENCIES = zlib lzo openssl
 
 VTUN_CONF_OPT = \
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9881c76..cebc4fb 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -7,7 +7,6 @@
 WPA_SUPPLICANT_VERSION = 0.6.10
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LIBTOOL_PATCH = NO
-WPA_SUPPLICANT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 WPA_SUPPLICANT_DEPENDENCIES =
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 60242cd..cb0690d 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -10,7 +10,6 @@ MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_AUTORECONF = NO
 MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
 MESA3D_INSTALL_STAGING = YES
-MESA3D_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
 
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index c607b15..0d615ca 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_ACECAD_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_ACECAD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-acecad))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index aae9327..0f03bb0 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_INPUT_AIPTEK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_AIPTEK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_AIPTEK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-aiptek))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 62fed30..49c5db2 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = NO
 XDRIVER_XF86_INPUT_EVDEV_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_EVDEV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-evdev))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 76a6b66..9c0e230 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_JOYSTICK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_JOYSTICK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-joystick))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index c7bf22e..2e68e5c 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_KEYBOARD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_KEYBOARD_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_KEYBOARD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-keyboard))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 529fa61..4302db4 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_MOUSE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_MOUSE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-mouse))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 387d6b4..9948d73 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individ
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_SYNAPTICS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-synaptics))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index e999ac8..3526236 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMO
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_VMMOUSE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-vmmouse))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 7ac6964..17f2a80 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_INPUT_VOID_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VOID_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-XDRIVER_XF86_INPUT_VOID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-void))
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index 24a0110..c0f4b82 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION)
 XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_APM_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
-XDRIVER_XF86_VIDEO_APM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-apm))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index b609ae7..7442706 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION)
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ARK_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_ARK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ark))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index bb2d6b6..daa94bb 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -8,6 +8,5 @@ XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_AST_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ast))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 59c9acf..8a5a1d0 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION)
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
-XDRIVER_XF86_VIDEO_ATI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ati))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index 237c61e..a79b2dd 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_CHIPS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CHIPS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_CHIPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-chips))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index d73c11c..47c3c9b 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_CIRRUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-cirrus))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 76974f7..8d3d8bf 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_DUMMY_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_DUMMY_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
-XDRIVER_XF86_VIDEO_DUMMY_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-dummy))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index bb04df8..97c20fa 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VE
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_FBDEV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-fbdev))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 342a163..03fd6d4 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GEODE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GEODE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_GEODE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-geode))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 897a532..d626572 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GLIDE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GLIDE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_GLIDE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glide))
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index b30cd40..5d50da1 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VE
 XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
-XDRIVER_XF86_VIDEO_GLINT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glint))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index b6c43ac..63c9ad7 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSI
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_I128_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i128))
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
index 5f66cc9..493fd34 100644
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSI
 XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I740_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_I740_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i740))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index c77b61e..0fe2553 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -11,6 +11,5 @@ XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_INTEL_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
-XDRIVER_XF86_VIDEO_INTEL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 9992cf0..5b72769 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64
 XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_MACH64_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-mach64))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 42bfbcd..033a32c 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION)
 XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-XDRIVER_XF86_VIDEO_MGA_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-mga))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 17234a4..db9c2c0 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NE
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-XDRIVER_XF86_VIDEO_NEOMAGIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-neomagic))
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index fb7dd1c..b9bf3e7 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWP
 XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEWPORT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_NEWPORT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-newport))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index de15a1e..39c53fa 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/dri
 XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NV_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_NV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-nv))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 486ab6f..87c5193 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -21,7 +21,6 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 	xproto_xf86driproto \
 	xproto_xproto
 
-XDRIVER_XF86_VIDEO_OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_OPENCHROME_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index e826a8a..0e74607 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSI
 XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_R128_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-r128))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index a7b1245..dc03a87 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_RENDITION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_RENDITION_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-rendition))
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index a9cf6d9..d6f7327 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).ta
 XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_S3_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index caf45e4..9c7b2c2 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VI
 XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3VIRGE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_S3VIRGE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3virge))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index a524ec7..4470736 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-XDRIVER_XF86_VIDEO_SAVAGE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-savage))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index f9cf2a0..97e416a 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF8
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_SILICONMOTION_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-siliconmotion))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 40ccab5..0fb335c 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION)
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
-XDRIVER_XF86_VIDEO_SIS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sis))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index 5068606..3cd6012 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
-XDRIVER_XF86_VIDEO_SISUSB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sisusb))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index 8fcbeda..6a0fb04 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNC
 XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG14_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNCG14_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg14))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index 7eec996..7ba7ecd 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3
 XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNCG3_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg3))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index 7d06344..7234e98 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6
 XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG6_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNCG6_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg6))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index 8c05b55..7c6019b 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB
 XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNFFB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunffb))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
index ddfb61d..38af6d0 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO
 XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNLEO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNLEO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunleo))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index 3b5d4de..b26d659 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX
 XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNTCX_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-XDRIVER_XF86_VIDEO_SUNTCX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suntcx))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index c3a4669..c11e408 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSI
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-XDRIVER_XF86_VIDEO_TDFX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tdfx))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 23f4823..68e58fb 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION)
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-XDRIVER_XF86_VIDEO_TGA_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tga))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index e26188d..da3edbb 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRID
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-XDRIVER_XF86_VIDEO_TRIDENT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-trident))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index 3ee7722..6ad8023 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VE
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TSENG_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_TSENG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tseng))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index a3bac6f..dffcf13 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION)
 XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_V4L_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
-XDRIVER_XF86_VIDEO_V4L_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-v4l))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 212e698..5d0ed12 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSI
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_VESA_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vesa))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index b1a3bb9..a92bc3b 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
-XDRIVER_XF86_VIDEO_VMWARE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vmware))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index 7b19a40..dadd3f4 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO
 XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-XDRIVER_XF86_VIDEO_VOODOO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-voodoo))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 2c30a09..389f9b6 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -10,6 +10,5 @@ XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_WSFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_WSFB_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_WSFB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-wsfb))
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 38883e2..49fb8b0 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION)
 XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_XGI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-xgi))
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index eec0378..c55390a 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -9,6 +9,5 @@ XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VE
 XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_XGIXP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-xgixp))
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index e398d30..b9f1d62 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -9,7 +9,6 @@ XKEYBOARD_CONFIG_SITE = http://xlibs.freedesktop.org/xkbdesc
 XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
-XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 920ed9c..f6795b5 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -6,7 +6,6 @@
 XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
 XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
-XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 7c74be7..fc66554 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -13,8 +13,6 @@ XVKBD_INSTALL_TARGET = YES
 XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 				CFLAGS="-O2 -I$(STAGING_DIR)/usr/include" USRLIBDIR="$(STAGING_DIR)/usr/lib"
 
-XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
 
 $(eval $(call AUTOTARGETS,package,xvkbd))
-- 
1.7.0.4
