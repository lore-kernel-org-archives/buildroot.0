From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 23:33:16 +0100
Subject: [Buildroot] [PATCH 4/6] Added libdvdread package (dependency of
	gst-plugins-bad)
In-Reply-To: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258065198-22972-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/libdvdread/Config.in     |    5 +++++
 package/multimedia/libdvdread/libdvdread.mk |   15 +++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libdvdread/Config.in
 create mode 100644 package/multimedia/libdvdread/libdvdread.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 7f60dcd..cd07fdc 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -10,6 +10,7 @@ source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
+source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
diff --git a/package/multimedia/libdvdread/Config.in b/package/multimedia/libdvdread/Config.in
new file mode 100644
index 0000000..7f7d229
--- /dev/null
+++ b/package/multimedia/libdvdread/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBDVDREAD
+	bool "libdvdread"
+	help
+	  libdvdread provides a simple foundation for reading
+	  DVD-Video images.
diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/multimedia/libdvdread/libdvdread.mk
new file mode 100644
index 0000000..e558819
--- /dev/null
+++ b/package/multimedia/libdvdread/libdvdread.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libdvdread
+#
+#############################################################
+
+LIBDVDREAD_VERSION = 4.1.3
+LIBDVDREAD_SOURCE = libdvdread_$(LIBDVDREAD_VERSION).orig.tar.gz
+LIBDVDREAD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libd/libdvdread/
+LIBDVDREAD_AUTORECONF = YES
+LIBDVDREAD_LIBTOOL_PATCH = YES
+LIBDVDREAD_INSTALL_STAGING = YES
+LIBDVDREAD_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package,libdvdread))
-- 
1.6.5.2
