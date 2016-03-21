From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 20:43:45 -0300
Subject: [Buildroot] [PATCH 2/2] libsoup: bump to version 2.54.0
In-Reply-To: <1458603825-2722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458603825-2722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458603825-2722-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 7878550..facedc6 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.52/libsoup-2.52.2.sha256sum
-sha256	db55628b5c7d952945bb71b236469057c8dfb8dea0c271513579c6273c2093dc	libsoup-2.52.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.0.sha256sum
+sha256	fbf1038efb10d2ffbbb88bb46e7ce32b683fde8e566f36bcf26f7f69a550ec56	libsoup-2.54.0.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index fd51a0e..53138be 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.52
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
+LIBSOUP_VERSION_MAJOR = 2.54
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no
+LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
 	libglib2 libxml2 sqlite host-intltool
 
-- 
2.7.3
