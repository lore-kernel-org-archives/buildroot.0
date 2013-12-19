From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:37:39 +0100
Subject: [Buildroot] [git commit] package: add <pkg>_VERSION_MAJOR variable
Message-ID: <20131219203823.065359BFC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa593ddbc19a03b0ba1821fbd869ce9c6d5bd3e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.mk               |    5 +++--
 package/gnutls/gnutls.mk             |    5 +++--
 package/gtk2-engines/gtk2-engines.mk |    5 +++--
 package/ipsec-tools/ipsec-tools.mk   |    5 +++--
 package/libart/libart.mk             |    5 +++--
 package/libglade/libglade.mk         |    5 +++--
 package/libsigc/libsigc.mk           |    5 +++--
 package/lighttpd/lighttpd.mk         |    5 +++--
 package/linphone/linphone.mk         |    5 +++--
 package/midori/midori.mk             |    5 +++--
 package/mysql_client/mysql_client.mk |    5 +++--
 package/nano/nano.mk                 |    5 +++--
 package/ntp/ntp.mk                   |    5 +++--
 package/nut/nut.mk                   |    5 +++--
 package/qt/qt.mk                     |    5 +++--
 package/qt5/qt5.mk                   |    5 +++--
 package/rpm/rpm.mk                   |    5 +++--
 package/ruby/ruby.mk                 |    5 +++--
 package/sdl_gfx/sdl_gfx.mk           |    5 +++--
 package/squid/squid.mk               |    5 +++--
 20 files changed, 60 insertions(+), 40 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index fd1cdd2..4594101 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-CMAKE_VERSION = 2.8.10.2
-CMAKE_SITE = http://www.cmake.org/files/v2.8/
+CMAKE_VERSION_MAJOR = 2.8
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).10.2
+CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)/
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8ab0665..aa68ca4 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.6
+GNUTLS_VERSION_MAJOR = 3.2
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
-GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
+GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf nettle pcre \
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 402b3c9..8d3193e 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-GTK2_ENGINES_VERSION = 2.20.2
+GTK2_ENGINES_VERSION_MAJOR = 2.20
+GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
 GTK2_ENGINES_SOURCE  = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE    = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.20
+GTK2_ENGINES_SITE    = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
 
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 8eeef1b..d5521ac 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-IPSEC_TOOLS_VERSION = 0.8.0
+IPSEC_TOOLS_VERSION_MAJOR = 0.8
+IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).0
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.8/
+IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)/
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 53dfe5a..39c72cc 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBART_VERSION = 2.3.21
+LIBART_VERSION_MAJOR = 2.3
+LIBART_VERSION = $(LIBART_VERSION_MAJOR).21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
-LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
+LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 343ecc4..e197122 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBGLADE_VERSION = 2.6.4
+LIBGLADE_VERSION_MAJOR = 2.6
+LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
+LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)/
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index d3e0135..7c127c4 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION = 2.2.11
+LIBSIGC_VERSION_MAJOR = 2.2
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).11
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
-LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_DEPENDENCIES = host-m4
 LIBSIGC_INSTALL_STAGING = YES
 LIBSIGC_LICENSE = LGPLv2.1+
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index bd63a1e..08a97ee 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIGHTTPD_VERSION = 1.4.33
+LIGHTTPD_VERSION_MAJOR = 1.4
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).33
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
-LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
+LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index e7e3de6..91830ae 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LINPHONE_VERSION = 3.6.1
-LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.6.x/sources
+LINPHONE_VERSION_MAJOR = 3.6
+LINPHONE_VERSION = $(LINPHONE_VERSION_MAJOR).1
+LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/$(LINPHONE_VERSION_MAJOR).x/sources
 LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 8887e49..ff56e43 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MIDORI_VERSION = 0.4.6
+MIDORI_VERSION_MAJOR = 0.4
+MIDORI_VERSION = $(MIDORI_VERSION_MAJOR).6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)/
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index fe24ae7..bd4c565 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MYSQL_CLIENT_VERSION = 5.1.70
+MYSQL_CLIENT_VERSION_MAJOR = 5.1
+MYSQL_CLIENT_VERSION = $(MYSQL_CLIENT_VERSION_MAJOR).70
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
-MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
+MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_CLIENT_VERSION_MAJOR)
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
 MYSQL_CLIENT_AUTORECONF = YES
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 67153a8..2b6df3a 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.3.2
-NANO_SITE = http://www.nano-editor.org/dist/v2.3
+NANO_VERSION_MAJOR = 2.3
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index e70dfab..40d8e4f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NTP_VERSION = 4.2.6p5
-NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
+NTP_VERSION_MAJOR = 4.2
+NTP_VERSION = $(NTP_VERSION_MAJOR).6p5
+NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_LICENSE = ntp license
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 25b88c4..04b2b41 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.6.5
-NUT_SITE = http://www.networkupstools.org/source/2.6/
+NUT_VERSION_MAJOR = 2.6
+NUT_VERSION = $(NUT_VERSION_MAJOR).5
+NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)/
 NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_DEPENDENCIES = host-pkgconf
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 194c19e..029d317 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,9 +11,10 @@
 #
 ################################################################################
 
-QT_VERSION = 4.8.5
+QT_VERSION_MAJOR = 4.8
+QT_VERSION = $(QT_VERSION_MAJOR).5
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://download.qt-project.org/official_releases/qt/4.8/$(QT_VERSION)
+QT_SITE    = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e925fb4..6b05334 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,6 @@
-QT5_VERSION = 5.2.0
-QT5_SITE = http://download.qt-project.org/official_releases/qt/5.2/$(QT5_VERSION)/submodules/
+QT5_VERSION_MAJOR = 5.2
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules/
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 89ce70e..97f64a2 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RPM_VERSION = 5.2.0
-RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
+RPM_VERSION_MAJOR = 5.2
+RPM_VERSION = $(RPM_VERSION_MAJOR).0
+RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)/
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a9c4e7d..d651e82 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION = 1.9.3-p484
-RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
+RUBY_VERSION_MAJOR = 1.9
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p484
+RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index c6b9451..3d65db4 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-SDL_GFX_VERSION = 2.0.23
+SDL_GFX_VERSION_MAJOR = 2.0
+SDL_GFX_VERSION = $(SDL_GFX_VERSION_MAJOR).23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
-SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-2.0/
+SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-$(SDL_GFX_VERSION_MAJOR)/
 SDL_GFX_LICENSE = zlib
 SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7c55557..e1b37be 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-SQUID_VERSION = 3.3.11
+SQUID_VERSION_MAJOR = 3.3
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
 SQUID_AUTORECONF = YES
