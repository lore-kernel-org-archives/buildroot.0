From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:39 +0200
Subject: [Buildroot] [PATCH 12 of 20] packages: rename FOO_AUTORECONF_OPT
 into FOO_AUTORECONF_OPTS
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <7671d1a5bdb5e0042b1e.1406668359@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_AUTORECONF_OPT.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt               |  2 +-
 package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk    |  2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  2 +-
 package/pkg-autotools.mk                                |  4 ++--
 package/webkit/webkit.mk                                |  2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff -r f0daa0c9e40d -r 7671d1a5bdb5 docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt	Tue Jul 29 22:09:17 2014 +0200
+++ b/docs/manual/adding-packages-autotools.txt	Tue Jul 29 22:04:21 2014 +0200
@@ -126,7 +126,7 @@
   +LIBFOO_AUTORECONF=YES+. These are passed in the environment of
   the 'autoreconf' command. By default, empty.
   
-* +LIBFOO_AUTORECONF_OPT+ to specify additional options
+* +LIBFOO_AUTORECONF_OPTS+ to specify additional options
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
 
diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
--- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk	Tue Jul 29 22:09:17 2014 +0200
+++ b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk	Tue Jul 29 22:04:21 2014 +0200
@@ -12,7 +12,7 @@
 
 # There is no generated configure script in the tarball.
 GST_PLUGIN_X170_AUTORECONF = YES
-GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
+GST_PLUGIN_X170_AUTORECONF_OPTS = -Im4/
 GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
 
 $(eval $(autotools-package))
diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk	Tue Jul 29 22:09:17 2014 +0200
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk	Tue Jul 29 22:04:21 2014 +0200
@@ -13,7 +13,7 @@
 GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
 
 GST1_PLUGINS_BAD_AUTORECONF = YES
-GST1_PLUGINS_BAD_AUTORECONF_OPT = -I $(@D)/common/m4
+GST1_PLUGINS_BAD_AUTORECONF_OPTS = -I $(@D)/common/m4
 GST1_PLUGINS_BAD_GETTEXTIZE = YES
 
 GST1_PLUGINS_BAD_CONF_OPT = \
diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Tue Jul 29 22:09:17 2014 +0200
+++ b/package/pkg-autotools.mk	Tue Jul 29 22:04:21 2014 +0200
@@ -100,7 +100,7 @@
 endif
 
 ifeq ($(4),host)
- $(2)_AUTORECONF_OPT ?= $$($(3)_AUTORECONF_OPT)
+ $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
 endif
 
 $(2)_CONF_ENV			?=
@@ -224,7 +224,7 @@
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPTS)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/webkit/webkit.mk
--- a/package/webkit/webkit.mk	Tue Jul 29 22:09:17 2014 +0200
+++ b/package/webkit/webkit.mk	Tue Jul 29 22:04:21 2014 +0200
@@ -17,7 +17,7 @@
 
 # webkit-disable-tests.patch changes configure.ac therefore autoreconf required
 WEBKIT_AUTORECONF = YES
-WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
+WEBKIT_AUTORECONF_OPTS = -I $(@D)/Source/autotools
 
 # parallel make install deadlocks with make 3.81
 WEBKIT_INSTALL_STAGING_OPTS = -j1 DESTDIR=$(STAGING_DIR) install
