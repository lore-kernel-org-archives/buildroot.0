From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Dec 2009 00:32:35 +0100
Subject: [Buildroot] [git commit master] Added libcdaudio package
	(dependency of gst-plugins-bad)
Message-ID: <20091210233611.31BB3777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fec9d0a099c896632069a29a50f8a6092082735f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add url to kconfig, fix AUTOTARGETS path]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    2 +-
 package/multimedia/Config.in                |    1 +
 package/multimedia/libcdaudio/Config.in     |    8 ++++++++
 package/multimedia/libcdaudio/libcdaudio.mk |   15 +++++++++++++++
 4 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/libcdaudio/Config.in
 create mode 100644 package/multimedia/libcdaudio/libcdaudio.mk

diff --git a/CHANGES b/CHANGES
index 80005c2..6e2b805 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	New packages: tcpreplay, hostapd
+	New packages: libcdaudio, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 98cf9d1..25ce01d 100644
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
index 0000000..02df01e
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
+	  http://libcdaudio.sourceforge.net/
diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/multimedia/libcdaudio/libcdaudio.mk
new file mode 100644
index 0000000..2f37cc2
--- /dev/null
+++ b/package/multimedia/libcdaudio/libcdaudio.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libcdaudio
+#
+#############################################################
+
+LIBCDAUDIO_VERSION = 0.99.12p2
+LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
+LIBCDAUDIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
+LIBCDAUDIO_AUTORECONF = YES
+LIBCDAUDIO_LIBTOOL_PATCH = YES
+LIBCDAUDIO_INSTALL_STAGING = YES
+LIBCDAUDIO_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libcdaudio))
-- 
1.6.3.3
