From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 11 Dec 2009 00:31:13 +0100
Subject: [Buildroot] [PATCH 1/6] package: Added libcdaudio package
	(dependency of gst-plugins-bad)
In-Reply-To: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1260487878-21126-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/libcdaudio/Config.in     |    8 ++++++++
 package/multimedia/libcdaudio/libcdaudio.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libcdaudio/Config.in
 create mode 100644 package/multimedia/libcdaudio/libcdaudio.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 49932d0..7f60dcd 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -9,6 +9,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
diff --git a/package/multimedia/libcdaudio/Config.in b/package/multimedia/libcdaudio/Config.in
new file mode 100644
index 0000000..cb29ea8
--- /dev/null
+++ b/package/multimedia/libcdaudio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCDAUDIO
+	bool "libcdaudio"
+	help
+	  libcdaudio is a library designed to provide functions to
+	  control operation of a CD-ROM when playing audio CDs. It
+	  also contains functions for CDDB and CD Index lookup.
+
+          http://libcdaudio.sourceforge.net/
diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/multimedia/libcdaudio/libcdaudio.mk
new file mode 100644
index 0000000..a168562
--- /dev/null
+++ b/package/multimedia/libcdaudio/libcdaudio.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libcdaudio
+#
+#############################################################
+
+LIBCDAUDIO_VERSION = 0.99.12p2
+LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
+LIBCDAUDIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
+LIBCDAUDIO_INSTALL_STAGING = YES
+LIBCDAUDIO_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libcdaudio))
-- 
1.6.5.4
