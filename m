From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  1 Jan 2020 21:59:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/gcr: bump to version 3.34.0
Message-ID: <20200101205901.3007890-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

intltool has been replace by gettext since version 3.33.4 and
https://gitlab.gnome.org/GNOME/gcr/commit/4fb05684d2f181c35898fc26f5675b07e7e2dd34
so replace host-intltool by $(TARGET_NLS_DEPENDENCIES)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcr/gcr.hash |  4 ++--
 package/gcr/gcr.mk   | 11 ++++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index a78f56517d..7d5786db9e 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,3 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.28/gcr-3.28.1.sha256sum
-sha256	95204aa2111c301778ebfbe60975ce3ed698c958430ffcc2a785ac5e593d168b	gcr-3.28.1.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.34/gcr-3.34.0.sha256sum
+sha256	29df50974a90987af694c0fb8926a6b366e68cacd8abd813817cfe1eb5d54524	gcr-3.34.0.tar.xz
 sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 7cf7ea79e5..2fe583978c 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,11 +4,16 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.28
-GCR_VERSION = $(GCR_VERSION_MAJOR).1
+GCR_VERSION_MAJOR = 3.34
+GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
-GCR_DEPENDENCIES = host-intltool host-pkgconf libgcrypt libglib2 p11-kit
+GCR_DEPENDENCIES = \
+	host-pkgconf \
+	libgcrypt \
+	libglib2 \
+	p11-kit \
+	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
 GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
 GCR_CONF_OPTS = \
-- 
2.24.0
