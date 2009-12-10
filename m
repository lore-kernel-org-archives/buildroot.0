From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Dec 2009 00:32:35 +0100
Subject: [Buildroot] [git commit master] Added libdvdread package
	(dependency of gst-plugins-bad)
Message-ID: <20091210233612.F3CEE777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1323ecdd094f0dd387bfe9db8c00cd9982ac1156
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use official upstream, add url to kconfig, fix AUTORARGETS path]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    2 +-
 package/multimedia/Config.in                |    1 +
 package/multimedia/libdvdread/Config.in     |    7 +++++++
 package/multimedia/libdvdread/libdvdread.mk |   15 +++++++++++++++
 4 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/libdvdread/Config.in
 create mode 100644 package/multimedia/libdvdread/libdvdread.mk

diff --git a/CHANGES b/CHANGES
index 6e2b805..67305f9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	New packages: libcdaudio, hostapd, tcpreplay
+	New packages: libcdaudio, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 25ce01d..5bb897b 100644
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
index 0000000..dea59eb
--- /dev/null
+++ b/package/multimedia/libdvdread/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDVDREAD
+	bool "libdvdread"
+	help
+	  libdvdread provides a simple foundation for reading
+	  DVD-Video images.
+
+	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/multimedia/libdvdread/libdvdread.mk
new file mode 100644
index 0000000..98b2ef5
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
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
+LIBDVDREAD_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+LIBDVDREAD_AUTORECONF = YES
+LIBDVDREAD_LIBTOOL_PATCH = YES
+LIBDVDREAD_INSTALL_STAGING = YES
+LIBDVDREAD_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libdvdread))
-- 
1.6.3.3
