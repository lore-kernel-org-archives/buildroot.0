From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat,  9 Jan 2010 13:59:27 -0500
Subject: [Buildroot] [PATCH] From http://www.icecast.org/ezstream.php
Message-ID: <1263063567-26152-1-git-send-email-clark.rawlins@escient.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Ezstream is a command line source client for Icecast media streaming servers.
It began as the successor of the old "shout" utility, and has since gained a
lot of useful features."

When I split the change for libshout and ezstream I botched the
spelling of package.  This corrects the problem.
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/ezstream/Config.in   |    7 +++++++
 package/multimedia/ezstream/ezstream.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/ezstream/Config.in
 create mode 100644 package/multimedia/ezstream/ezstream.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index dfbe8bf..c9ec4e1 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -3,6 +3,7 @@ source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/ezstream/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
diff --git a/package/multimedia/ezstream/Config.in b/package/multimedia/ezstream/Config.in
new file mode 100644
index 0000000..8b80f6d
--- /dev/null
+++ b/package/multimedia/ezstream/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EZSTREAM
+	bool "ezstream"
+	default n
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBSHOUT
+	help
+	  A thin ICECAST source client
diff --git a/package/multimedia/ezstream/ezstream.mk b/package/multimedia/ezstream/ezstream.mk
new file mode 100644
index 0000000..6e9a726
--- /dev/null
+++ b/package/multimedia/ezstream/ezstream.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# ezstream
+#
+#############################################################
+EZSTREAM_VERSION=0.5.3
+EZSTREAM_SOURCE=ezstream-$(EZSTREAM_VERSION).tar.gz
+EZSTREAM_SITE=http://downloads.xiph.org/releases/ezstream
+EZSTREAM_AUTORECONF = NO
+EZSTREAM_INSTALL_STAGING = NO
+EZSTREAM_INSTALL_TARGET = YES
+EZSTREAM_DEPENDENCIES = libshout libxml2
+$(eval $(call AUTOTARGETS,package/multimedia,ezstream))
+
-- 
1.6.3.3
