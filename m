From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 20:28:17 +0200
Subject: [Buildroot] [PATCH] new package: libcanberra
Message-ID: <1361471297-23210-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcanberra

Portable sound event library

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                  |    1 +
 package/libcanberra/Config.in      |   10 ++++++++++
 package/libcanberra/libcanberra.mk |   17 +++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libcanberra/Config.in
 create mode 100644 package/libcanberra/libcanberra.mk

diff --git a/package/Config.in b/package/Config.in
index 51e92a2..28bb55c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
 source "package/libao/Config.in"
+source "package/libcanberra/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
 source "package/libcuefile/Config.in"
diff --git a/package/libcanberra/Config.in b/package/libcanberra/Config.in
new file mode 100644
index 0000000..59accd0
--- /dev/null
+++ b/package/libcanberra/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCANBERRA
+	bool "libcanberra"
+	select	BR2_PACKAGE_ALSA_LIB
+	select	BR2_PACKAGE_LIBGTK2
+	select	BR2_PACKAGE_LIBVORBIS
+	help
+	  Portable sound event library
+
+	  http://0pointer.de/lennart/projects/libcanberra
+
diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
new file mode 100644
index 0000000..9394294
--- /dev/null
+++ b/package/libcanberra/libcanberra.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libcanberra
+#
+#############################################################
+
+LIBCANBERRA_VERSION = 0.27
+LIBCANBERRA_SITE = http://0pointer.de/lennart/projects/libcanberra
+LIBCANBERRA_INSTALL_STAGING = YES
+LIBCANBERRA_DEPENDENCIES = libvorbis libtool alsa-lib libgtk2
+LIBCANBERRA_CONF_OPT += --disable-oss --enable-gtk
+LIBCANBERRA_LICENSE = LGPLv2.1+
+LIBCANBERRA_LICENSE_FILES = LGPL
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
