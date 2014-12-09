From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:25 +0000
Subject: [Buildroot] [PATCH 5/8] Adding libwebsock
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-5-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/libwebsock/Config.in     |  7 +++++++
 package/libwebsock/libwebsock.mk | 22 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/libwebsock/Config.in
 create mode 100644 package/libwebsock/libwebsock.mk

diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
new file mode 100644
index 0000000..7b4b2dc
--- /dev/null
+++ b/package/libwebsock/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBWEBSOCK
+	bool "libwebsock"
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  Adds libwebsock - C library for easy WebSockets servers
+
+	  https://github.com/payden/libwebsock
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
new file mode 100644
index 0000000..e562630
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
+
+LIBWEBSOCK_SITE = https://github.com/payden/libwebsock.git
+LIBWEBSOCK_DEPENDENCIES = libevent
+# straight out of git - not ./configure
+LIBWEBSOCK_AUTORECONF = YES
+LIBWEBSOCK_INSTALL_STAGING = YES
+LIBWEBSOCK_LICENSE = LGPLv3
+LIBWEBSOCK_LICENSE_FILES = COPYING
+
+LIBWEBSOCK_LIBS += -lpthread -levent
+
+LIBWEBSOCK_CONF_ENV += \
+        LIBS="$(LIBWEBSOCK_LIBS)"
+
+$(eval $(autotools-package))
-- 
1.9.1
