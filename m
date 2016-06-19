From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:06:08 +0200
Subject: [Buildroot] [git commit] package/libdvdcss: new package
Message-ID: <20160619213724.2B37580489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26a7e5594f72dd46f1c423f53b3433e1a22bef3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |  1 +
 package/libdvdcss/Config.in      |  7 +++++++
 package/libdvdcss/libdvdcss.hash |  2 ++
 package/libdvdcss/libdvdcss.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0252899..02cc3bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1100,6 +1100,7 @@ menu "Multimedia"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
+	source "package/libdvdcss/Config.in"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
diff --git a/package/libdvdcss/Config.in b/package/libdvdcss/Config.in
new file mode 100644
index 0000000..a8c3b84
--- /dev/null
+++ b/package/libdvdcss/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDVDCSS
+	bool "libdvdcss"
+	help
+	  libdvdcss is a simple library designed for accessing DVDs like
+	  a block device without having to bother about the decryption.
+
+	  http://www.videolan.org/developers/libdvdcss.html
diff --git a/package/libdvdcss/libdvdcss.hash b/package/libdvdcss/libdvdcss.hash
new file mode 100644
index 0000000..57abd77
--- /dev/null
+++ b/package/libdvdcss/libdvdcss.hash
@@ -0,0 +1,2 @@
+# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.0/libdvdcss-1.4.0.tar.bz2.sha256
+sha256	2089375984800df29a4817b37f3123c1706723342d6dab4d0a8b75c25c2c845a	libdvdcss-1.4.0.tar.bz2
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
new file mode 100644
index 0000000..8e1c929
--- /dev/null
+++ b/package/libdvdcss/libdvdcss.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libdvdcss
+#
+################################################################################
+
+LIBDVDCSS_VERSION = 1.4.0
+LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.bz2
+LIBDVDCSS_SITE = http://www.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
+LIBDVDCSS_INSTALL_STAGING = YES
+LIBDVDCSS_LICENSE = GPLv2+
+LIBDVDCSS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
