From: =?utf-8?B?6LW1IOW7uui+iQ==?= <zhaojh329@outlook.com>
Date: Tue, 3 Sep 2019 04:54:00 +0000
Subject: [Buildroot] [PATCH 1/1] libuwsc: new package
Message-ID: <KL1PR0201MB21194E30E14A3D58B3090993FAB90@KL1PR0201MB2119.apcprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@outlook.com>
---
?package/Config.in ? ? ? ? ?| ?1 +
?package/libuwsc/Config.in ?| ?8 ++++++++
?package/libuwsc/libuwsc.mk | 13 +++++++++++++
?3 files changed, 22 insertions(+)
?create mode 100644 package/libuwsc/Config.in
?create mode 100644 package/libuwsc/libuwsc.mk

diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..d1ea644cd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1622,6 +1622,7 @@ menu "Networking"
? ? ? ? source "package/libupnp18/Config.in"
? ? ? ? source "package/libupnpp/Config.in"
? ? ? ? source "package/liburiparser/Config.in"
+ ? ? ? source "package/libuwsc/Config.in"
? ? ? ? source "package/libvncserver/Config.in"
? ? ? ? source "package/libwebsock/Config.in"
? ? ? ? source "package/libwebsockets/Config.in"
diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
new file mode 100644
index 0000000000..ae99b6d2dc
--- /dev/null
+++ b/package/libuwsc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUWSC
+ ? ? ? bool "libuwsc"
+ ? ? ? select BR2_PACKAGE_LIBEV
+ ? ? ? help
+ ? ? ? ? A Lightweight and fully asynchronous WebSocket client
+ ? ? ? ? library based on libev.
+
+ ? ? ? ? https://github.com/zhaojh329/libuwsc
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
new file mode 100644
index 0000000000..354a866739
--- /dev/null
+++ b/package/libuwsc/libuwsc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libuwsc
+#
+################################################################################
+
+LIBUWSC_VERSION = 3.3.2
+LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
+LIBUWSC_LICENSE = MIT
+LIBUWSC_INSTALL_STAGING = YES
+LIBUWSC_DEPENDENCIES = libev
+
+$(eval $(cmake-package))
--?
2.17.1
