From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:45 +0100
Subject: [Buildroot] [PATCH v2 02/12] libbluray: new package
In-Reply-To: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389831355-19983-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBBLURAY is a client library for accessing bluray disks.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2
    - Bump version to 0.5.0 and add missing build dependency (Bernd Kuhls)
---
 package/Config.in              |  1 +
 package/libbluray/Config.in    |  6 ++++++
 package/libbluray/libbluray.mk | 19 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk

diff --git a/package/Config.in b/package/Config.in
index 1d6c9c6..0d3c0ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -628,6 +628,7 @@ endmenu
 
 menu "Multimedia"
 source "package/libass/Config.in"
+source "package/libbluray/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libdvdread/Config.in"
diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
new file mode 100644
index 0000000..eeb93dc
--- /dev/null
+++ b/package/libbluray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBBLURAY
+	bool "libbluray"
+	help
+	  libbluray is a client library for accessing bluray disks.
+
+	  http://www.videolan.org/developers/libbluray.html
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
new file mode 100644
index 0000000..e1e6bdd
--- /dev/null
+++ b/package/libbluray/libbluray.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libbluray
+#
+################################################################################
+
+LIBBLURAY_VERSION = 0.5.0
+LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_INSTALL_STAGING = YES
+LIBBLURAY_LICENSE = LGPLv2.1+
+LIBBLURAY_LICENSE_FILES = COPYING
+LIBBLURAY_DEPENDENCIES = host-pkgconf freetype bzip2 libxml2 zlib
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+	LIBBLURAY_DEPENDENCIES += libiconv
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.2
