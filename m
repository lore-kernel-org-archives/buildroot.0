From: =?UTF-8?q?Manuel=20Gro=C3=9F?= <mgr@nordkrater.de>
Date: Tue, 16 Aug 2016 07:35:02 +0200
Subject: [Buildroot] [PATCH] websocketpp: new package
In-Reply-To: <20160816053502.15187-1-mgr@nordkrater.de>
References: <20160813112629.31883-1-mgr@nordkrater.de>
 <20160816053502.15187-1-mgr@nordkrater.de>
Message-ID: <20160816053502.15187-2-mgr@nordkrater.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides websocketpp, a header only C++ library that implements websocket client and server functionality.

Signed-off-by: Manuel Gro? <mgr@nordkrater.de>
---
 package/Config.in                  |  1 +
 package/websocketpp/Config.in      | 12 ++++++++++++
 package/websocketpp/websocketpp.mk | 21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/websocketpp/Config.in
 create mode 100644 package/websocketpp/websocketpp.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..e99850d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1242,6 +1242,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
+	source "package/websocketpp/Config.in"
 	source "package/wvstreams/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
diff --git a/package/websocketpp/Config.in b/package/websocketpp/Config.in
new file mode 100644
index 0000000..2b24b0d
--- /dev/null
+++ b/package/websocketpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_WEBSOCKETPP
+	bool "websocketpp"
+	help
+	  WebSocket++ is a header only C++ library that implements RFC6455 The
+	  WebSocket Protocol. It allows integrating WebSocket client and server
+	  functionality into C++ programs. It uses interchangeable network
+	  transport modules including one based on raw char buffers, one based
+	  on C++ iostreams, and one based on Asio (either via Boost or
+	  standalone). End users can write additional transport policies to
+	  support other networking or event libraries as needed.
+
+	  http://www.zaphoyd.com/websocketpp/
diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
new file mode 100644
index 0000000..00f451f
--- /dev/null
+++ b/package/websocketpp/websocketpp.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+## websocketpp
+#
+#################################################################################
+
+WEBSOCKETPP_VERSION = 0.7.0
+WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
+WEBSOCKETPP_INSTALL_STAGING = YES
+WEBSOCKETPP_LICENSE = BSD or MIT
+WEBSOCKETPP_LICENSE_FILES = COPYING
+
+WEBSOCKETPP_VERSION_CONF_OPTS = \
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)"
+
+define WEBSOCKETPP_INSTALL_STAGING_CMDS
+	cp -vR $(@D)/websocketpp $(STAGING_DIR)/usr/include/websocketpp
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
