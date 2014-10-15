From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 23:23:48 +0200
Subject: [Buildroot] [PATCH 1/4] libshout: new package
Message-ID: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in            |  1 +
 package/libshout/Config.in   | 10 ++++++++++
 package/libshout/libshout.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libshout/Config.in
 create mode 100644 package/libshout/libshout.mk

diff --git a/package/Config.in b/package/Config.in
index 19bb9bf..f0eb71a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -805,6 +805,7 @@ menu "Networking"
 	source "package/librsync/Config.in"
 	source "package/libsocketcan/Config.in"
 	source "package/libshairplay/Config.in"
+	source "package/libshout/Config.in"
 	source "package/libsoup/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
diff --git a/package/libshout/Config.in b/package/libshout/Config.in
new file mode 100644
index 0000000..36c8531
--- /dev/null
+++ b/package/libshout/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSHOUT
+  bool "libshout"
+  select BR2_PACKAGE_LIBOGG
+  select BR2_PACKAGE_LIBVORBIS
+  help
+    Libshout is a library for communicating with and sending data to an
+    icecast server.  It handles the socket connection, the timing of the
+    data, and prevents bad data from getting to the icecast server.
+
+    http://icecast.org/download/
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
new file mode 100644
index 0000000..9d7f39c
--- /dev/null
+++ b/package/libshout/libshout.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libshout
+#
+################################################################################
+
+LIBSHOUT_VERSION = 2.3.1
+LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
+LIBSHOUT_LICENSE = LGPLv2
+LIBSHOUT_LICENSE_FILES = COPYING
+LIBSHOUT_INSTALL_STAGING = YES
+LIBSHOUT_DEPENDENCIES = libogg libvorbis
+
+$(eval $(autotools-package))
-- 
2.1.2
