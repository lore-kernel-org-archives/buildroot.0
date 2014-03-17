From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 23:50:08 +0100
Subject: [Buildroot] [git commit] package: drop <PKG>_VERSION_MINOR variable
Message-ID: <20140317225058.428EC9C0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3749143418a2a735ceaed63667a8b3ef66bba9e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since <PKG>_VARIABLE_MINOR variable in some packages is used only once,
so it is unusable. This patch removes it.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.mk             |    3 +--
 package/glib-networking/glib-networking.mk |    3 +--
 package/glibmm/glibmm.mk                   |    3 +--
 package/gvfs/gvfs.mk                       |    3 +--
 package/json-glib/json-glib.mk             |    3 +--
 package/lame/lame.mk                       |    3 +--
 package/libgail/libgail.mk                 |    3 +--
 package/libglib2/libglib2.mk               |    3 +--
 package/libgtk2/libgtk2.mk                 |    3 +--
 package/librsvg/librsvg.mk                 |    3 +--
 package/libsoup/libsoup.mk                 |    3 +--
 package/libxmlpp/libxmlpp.mk               |    3 +--
 package/metacity/metacity.mk               |    3 +--
 package/olsr/olsr.mk                       |    3 +--
 package/pango/pango.mk                     |    3 +--
 package/sylpheed/sylpheed.mk               |    3 +--
 package/tcl/tcl.mk                         |    3 +--
 package/vala/vala.mk                       |    3 +--
 18 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index d891760..bb723f7 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.3
-FETCHMAIL_VERSION_MINOR = 26
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).$(FETCHMAIL_VERSION_MINOR)
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).26
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)/
 FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 405fbc2..fa6e20f 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.36
-GLIB_NETWORKING_VERSION_MINOR = 2
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).$(GLIB_NETWORKING_VERSION_MINOR)
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).2
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 9eaa197..4081251 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 GLIBMM_VERSION_MAJOR = 2.36
-GLIBMM_VERSION_MINOR = 1
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).$(GLIBMM_VERSION_MINOR)
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6e88f6e..dbf234e 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.16
-GVFS_VERSION_MINOR = 2
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index f0f4397..cffe958 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 0.14
-JSON_GLIB_VERSION_MINOR = 2
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).$(JSON_GLIB_VERSION_MINOR)
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 38a39a3..938b759 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LAME_VERSION_MAJOR = 3.99
-LAME_VERSION_MINOR = 5
-LAME_VERSION = $(LAME_VERSION_MAJOR).$(LAME_VERSION_MINOR)
+LAME_VERSION = $(LAME_VERSION_MAJOR).5
 LAME_SITE = http://downloads.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
 LAME_DEPENDENCIES = host-pkgconf
 LAME_INSTALL_STAGING = YES
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 4142c7f..3034b41 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBGAIL_VERSION_MAJOR = 1.22
-LIBGAIL_VERSION_MINOR = 3
-LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).$(LIBGAIL_VERSION_MINOR)
+LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).3
 LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
 LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
 LIBGAIL_AUTORECONF = YES
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d29b938..8df7c55 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.38
-LIBGLIB2_VERSION_MINOR = 2
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 50d0510..cadca63 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION_MINOR = 18
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).18
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 2decd94..9385fe9 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.26
-LIBRSVG_VERSION_MINOR = 3
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).3
 LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index e618ffe..11585c8 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.43
-LIBSOUP_VERSION_MINOR = 1
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).$(LIBSOUP_VERSION_MINOR)
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index cc26d94..d9dd862 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBXMLPP_VERSION_MAJOR = 2.34
-LIBXMLPP_VERSION_MINOR = 2
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).$(LIBXMLPP_VERSION_MINOR)
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
 LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 18f5c76..6ed1ba6 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -6,8 +6,7 @@
 
 # newer versions need libcanberra-gtk and gnome-doc-utils
 METACITY_VERSION_MAJOR = 2.25
-METACITY_VERSION_MINOR = 1
-METACITY_VERSION = $(METACITY_VERSION_MAJOR).$(METACITY_VERSION_MINOR)
+METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
 METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 511b2e7..3b7310e 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.6
-OLSR_VERSION_MINOR = 6.1
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.1
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 82ba542..31d92ba 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.28
-PANGO_VERSION_MINOR = 4
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
 
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index cc79eeb..63e4e90 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 SYLPHEED_VERSION_MAJOR = 3.2
-SYLPHEED_VERSION_MINOR = 0
-SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
+SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 58f085a..4647f03 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.4
-TCL_VERSION_MINOR = 19
-TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
+TCL_VERSION = $(TCL_VERSION_MAJOR).19
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 03608a0..368e3f8 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.18
-VALA_VERSION_MINOR = 1
-VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
+VALA_VERSION = $(VALA_VERSION_MAJOR).1
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
