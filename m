From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:39:36 +0200
Subject: [Buildroot] [git commit] libsoup: Remove redundant dependency on
	gettext
Message-ID: <20130730213928.5F8839ABC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09704e7ee8a6e49d68359df7b4ebffb4d7819965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsoup doesn't use intl stuff directly, but uses gi18n.  libglib2
already has all required dependencies on gettext.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/Config.in  |    1 -
 package/libsoup/libsoup.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index b80cb63..7116b71 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_SQLITE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 252214f..d57960c 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 \
+LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
        libglib2 libxml2 sqlite host-intltool
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
