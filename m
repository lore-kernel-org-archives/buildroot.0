From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:33 +0100
Subject: [Buildroot] [PATCH 03/13] libbluray: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <687bab14d1ef9d217df22d2875e5ccc03b924e0e.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBBLURAY is a client library for accessing bluray disks.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in              |    1 +
 package/libbluray/Config.in    |    6 ++++++
 package/libbluray/libbluray.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libbluray/Config.in
 create mode 100644 package/libbluray/libbluray.mk

diff --git a/package/Config.in b/package/Config.in
index 0da1905..5682cd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -474,6 +474,7 @@ endmenu
 
 menu "Multimedia"
 source "package/libass/Config.in"
+source "package/libbluray/Config.in"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
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
index 0000000..a1fc69b
--- /dev/null
+++ b/package/libbluray/libbluray.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libbluray
+#
+#############################################################
+
+LIBBLURAY_VERSION = 0.2.2
+LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_INSTALL_STAGING = YES
+LIBBLURAY_LICENSE = LGPLv2.1
+LIBBLURAY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
