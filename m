From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] libsoup: bump version to 2.31.2
Message-ID: <20100727210246.DC8BC83609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6f5188120b3ca1e7ca34848e34969710a411a5a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 9757698..2c9a486 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,13 +4,12 @@
 #
 #############################################################
 
-LIBSOUP_MAJOR_VERSION:=2.26
+LIBSOUP_MAJOR_VERSION:=2.31
 LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
 LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
 LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
-LIBSOUP_AUTORECONF = YES
 LIBSOUP_INSTALL_STAGING = YES
-LIBSOUP_INSTALL_TARGET = YES
+LIBSOUP_LIBTOOL_PATCH = NO
 
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 
@@ -23,8 +22,8 @@ LIBSOUP_CONF_OPT = \
 	--enable-static		\
 	--disable-explicit-deps \
 	--disable-glibtest	\
-	--without-gnome		\
-	--disable-gtk-doc
+	--disable-ssl		\
+	--without-gnome
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
-- 
1.7.1
