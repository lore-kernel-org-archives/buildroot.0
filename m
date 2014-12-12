From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:45 +0000
Subject: [Buildroot] [PATCH v2 5/7] Adding libwebsock
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-6-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in                  |  1 +
 package/libwebsock/Config.in       |  6 ++++++
 package/libwebsock/libwebsock.hash |  1 +
 package/libwebsock/libwebsock.mk   | 22 ++++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/libwebsock/Config.in
 create mode 100644 package/libwebsock/libwebsock.hash
 create mode 100644 package/libwebsock/libwebsock.mk

diff --git a/package/Config.in b/package/Config.in
index 501f505..77430b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -851,6 +851,7 @@ menu "Networking"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
+	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
new file mode 100644
index 0000000..427b3fd
--- /dev/null
+++ b/package/libwebsock/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBWEBSOCK
+	bool "libwebsock"
+	select BR2_PACKAGE_LIBEVENT
+	help
+	Adds libwebsock
+	https://github.com/payden/libwebsock
diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
new file mode 100644
index 0000000..2250c09
--- /dev/null
+++ b/package/libwebsock/libwebsock.hash
@@ -0,0 +1 @@
+sha256,ac459d1de0205f8aedf2fd10a48cb02a06acb127c3403001670a839502e02afd
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
new file mode 100644
index 0000000..f82b553
--- /dev/null
+++ b/package/libwebsock/libwebsock.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libwebsock
+#
+#############################################################
+LIBWEBSOCK_VERSION = 3c1615eeadb0b582b63851073bfe3e5132f31ebc 
+LIBWEBSOCK_SITE_METHOD = git
+LIBWEBSOCK_SITE = https://github.com/payden/libwebsock.git
+LIBWEBSOCK_DEPENDENCIES = libevent
+LIBWEBSOCK_AUTORECONF = YES
+LIBWEBSOCK_INSTALL_STAGING = YES
+LIBWEBSOCK_LICENSE = LGPLv3
+LIBWEBSOCK_LICENSE_FILES = COPYING
+
+LIBWEBSOCK_CFLAGS = $(TARGET_CFLAGS)
+LIBWEBSOCK_LIBS += -lpthread -levent
+
+LIBWEBSOCK_CONF_ENV += \
+        CFLAGS="$(LIBWEBSOCK_CFLAGS)" \
+        LIBS="$(LIBWEBSOCK_LIBS)"
+
+$(eval $(autotools-package))
-- 
1.9.1
