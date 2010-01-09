From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat,  9 Jan 2010 13:26:28 -0500
Subject: [Buildroot] [PATCH 2/2] Add Ezstream to buildroot
In-Reply-To: <1263061588-9798-1-git-send-email-clark.rawlins@escient.com>
References: <1263061588-9798-1-git-send-email-clark.rawlins@escient.com>
Message-ID: <1263061588-9798-2-git-send-email-clark.rawlins@escient.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clark Rawlins <clark@bit63.org>

From http://www.icecast.org/ezstream.php
"Ezstream is a command line source client for Icecast media streaming servers.
It began as the successor of the old "shout" utility, and has since gained a
lot of useful features."

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/ezstream/Config.in   |    7 +++++++
 package/multimedia/ezstream/ezstream.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/ezstream/Config.in
 create mode 100644 package/multimedia/ezstream/ezstream.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index dfbe8bf..0852c4a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -3,6 +3,7 @@ source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "pakcage/multimedia/ezstream/Config.in"
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
