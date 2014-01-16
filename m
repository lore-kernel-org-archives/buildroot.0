From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 16 Jan 2014 10:00:21 +0100
Subject: [Buildroot] [PATCH] libsocketcan: new package
In-Reply-To: <1389862821-16980-1-git-send-email-yegorslists@googlemail.com>
References: <1389862821-16980-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1389862821-16980-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |    1 +
 package/libsocketcan/Config.in       |    6 ++++++
 package/libsocketcan/libsocketcan.mk |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/libsocketcan/Config.in
 create mode 100644 package/libsocketcan/libsocketcan.mk

diff --git a/package/Config.in b/package/Config.in
index 2f62d6c..dca90d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ source "package/liboping/Config.in"
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
-- 
1.7.7
