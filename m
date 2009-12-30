From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Dec 2009 13:48:02 +0100
Subject: [Buildroot] [git commit master] package: fix host build for
	packages with own libtool patch
Message-ID: <20091230125025.3ED1A776B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c63c2faf55b2eb53eda67532929f3e35419f8c40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages which also build a host variant and have LIBTOOL_PATCH = NO,
should also disable libtool patching for the host build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk         |    1 +
 package/directfb/directfb.mk |    1 +
 package/expat/expat.mk       |    1 +
 package/freetype/freetype.mk |    1 +
 package/libglib2/libglib2.mk |    1 +
 5 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 63f3caa..276009c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -7,6 +7,7 @@ DBUS_VERSION = 1.2.16
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
+HOST_DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
 ifeq ($(BR2_ENABLE_DEBUG),y)
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 57b2e17..a4ee3bc 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -9,6 +9,7 @@ DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSIO
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
 DIRECTFB_LIBTOOL_PATCH = NO
+HOST_DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_INSTALL_TARGET = YES
 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5b4eb97..368a297 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -8,6 +8,7 @@ EXPAT_VERSION = 2.0.1
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_LIBTOOL_PATCH = NO
+HOST_EXPAT_LIBTOOL_PATCH = NO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_TARGET = YES
 # no install-strip / install-exec
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ed73253..abc0afc 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -7,6 +7,7 @@ FREETYPE_VERSION = 2.3.9
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
+HOST_FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 04e3f2d..5ef7e25 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -11,6 +11,7 @@ LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
 
 LIBGLIB2_AUTORECONF = NO
 LIBGLIB2_LIBTOOL_PATCH = NO
+HOST_LIBGLIB2_LIBTOOL_PATCH = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.6.3.3
