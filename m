From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 16 Dec 2015 21:51:53 -0300
Subject: [Buildroot] [PATCH] libsecret: bump to version 0.18.3
Message-ID: <1450313513-8013-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Also forcibly disable GIR (default=auto) to avoid issues.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libsecret/libsecret.hash |  4 ++--
 package/libsecret/libsecret.mk   | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index 8e5bbf7..d40f320 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.sha256sum
-sha256	0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3	libsecret-0.18.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.3.sha256sum
+sha256	f2bf1d0c5ab4640664f3e3c7ef6b086c180e50ff415720b5e22f96750dbf84c9	libsecret-0.18.3.tar.xz
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 5a230ae..a762dd7 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-LIBSECRET_VERSION = 0.18
-LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
+LIBSECRET_VERSION_MAJOR = 0.18
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).3
+LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
 LIBSECRET_DEPENDENCIES = libglib2 host-intltool
-LIBSECRET_CONF_OPTS = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
+LIBSECRET_CONF_OPTS = \
+	--disable-manpages \
+	--disable-strict \
+	--disable-coverage \
+	--enable-introspection=no \
+	--enable-vala=no
 LIBSECRET_LICENSE = LGPLv2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
-- 
2.4.10
