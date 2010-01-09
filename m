From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat,  9 Jan 2010 13:26:27 -0500
Subject: [Buildroot] [PATCH 1/2] Add the libshout package to buildroot
Message-ID: <1263061588-9798-1-git-send-email-clark.rawlins@escient.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clark Rawlins <clark@bit63.org>

libshout is part of the icecast family of packages
used to support multiple streaming sources for injection
into an icecast server.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/libshout/Config.in   |    6 ++++++
 package/multimedia/libshout/libshout.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libshout/Config.in
 create mode 100644 package/multimedia/libshout/libshout.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 8a55caf..dfbe8bf 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -17,6 +17,7 @@ source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libshout/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
diff --git a/package/multimedia/libshout/Config.in b/package/multimedia/libshout/Config.in
new file mode 100644
index 0000000..667d63d
--- /dev/null
+++ b/package/multimedia/libshout/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSHOUT
+	bool "libshout"
+	select BR2_PACKAGE_LIBVORBIS
+	default n
+	help
+	  Library for implementing source clients for icecast
diff --git a/package/multimedia/libshout/libshout.mk b/package/multimedia/libshout/libshout.mk
new file mode 100644
index 0000000..0e16d0e
--- /dev/null
+++ b/package/multimedia/libshout/libshout.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libshout
+#
+#############################################################
+LIBSHOUT_VERSION = 2.2.2
+LIBSHOUT_SOURCE = libshout-$(LIBSHOUT_VERSION).tar.gz
+LIBSHOUT_SITE = http://downloads.us.xiph.org/releases/libshout
+LIBSHOUT_AUTORECONF = NO
+LIBSHOUT_INSTALL_STAGING = YES
+LIBSHOUT_INSTALL_TARGET = YES
+LIBSHOUT_DEPENDENCIES = libvorbis
+$(eval $(call AUTOTARGETS,package/multimedia,libshout))
+
-- 
1.6.3.3
