From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2014 22:45:15 +0100
Subject: [Buildroot] [git commit] libsocketcan: new package
Message-ID: <20140120214721.7DDEE9A0BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74975dee52f2d9a0324e115b00d4c68d6e33dc7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/libsocketcan/Config.in       |    6 ++++++
 package/libsocketcan/libsocketcan.mk |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8c8f616..8495cdd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -681,6 +681,7 @@ source "package/liboping/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/librsync/Config.in"
+source "package/libsocketcan/Config.in"
 source "package/libsoup/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
diff --git a/package/libsocketcan/Config.in b/package/libsocketcan/Config.in
new file mode 100644
index 0000000..97903db
--- /dev/null
+++ b/package/libsocketcan/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSOCKETCAN
+	bool "libsocketcan"
+	help
+	  SocketCAN library to control CAN devices from C code.
+
+	  http://git.pengutronix.de/?p=tools/libsocketcan.git;a=summary
diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
new file mode 100644
index 0000000..920a900
--- /dev/null
+++ b/package/libsocketcan/libsocketcan.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# libsocketcan
+#
+################################################################################
+LIBSOCKETCAN_VERSION = 0.0.9
+LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
+LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
+
+$(eval $(autotools-package))
