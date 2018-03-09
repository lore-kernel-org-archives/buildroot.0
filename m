From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:53 +0100
Subject: [Buildroot] [PATCH 02/10] package: add python-websocket-client
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebSocket client module for python.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-websocket-client/Config.in                  |  9 +++++++++
 .../python-websocket-client/python-websocket-client.hash   |  4 ++++
 package/python-websocket-client/python-websocket-client.mk | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-websocket-client/Config.in
 create mode 100644 package/python-websocket-client/python-websocket-client.hash
 create mode 100644 package/python-websocket-client/python-websocket-client.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cd2ac85ae..d4bd10fa28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1390,6 +1390,7 @@ F:	package/python-enum34/
 F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
+F:	package/python-websocket-client/
 F:	package/triggerhappy/
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/package/Config.in b/package/Config.in
index a5604fc36b..9c727cad6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -949,6 +949,7 @@ menu "External python modules"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
+	source "package/python-websocket-client/Config.in"
 	source "package/python-websockets/Config.in"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-whoosh/Config.in"
diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
new file mode 100644
index 0000000000..0fbb15b328
--- /dev/null
+++ b/package/python-websocket-client/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
+	bool "python-websocket-client"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  WebSocket client for python. hybi13 is supported.
+
+	  https://github.com/websocket-client/websocket-client.git
diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
new file mode 100644
index 0000000000..3672ca074b
--- /dev/null
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/websocket-client/json, sha256 locally computed
+md5	790b3ecb5364293ad70c59a1b92debb1  websocket_client-0.47.0.tar.gz
+sha256	a453dc4dfa6e0db3d8fd7738a308a88effe6240c59f3226eb93e8f020c216149  websocket_client-0.47.0.tar.gz
+sha256	e580b2a1a57c33085dd6a07cff693d828f7c3fa8a11ce56ade2a62c46951930d  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
new file mode 100644
index 0000000000..58c8407db3
--- /dev/null
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-websocket-client
+#
+################################################################################
+
+PYTHON_WEBSOCKET_CLIENT_VERSION = 0.47.0
+PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
+PYTHON_WEBSOCKET_CLIENT_SITE = https://pypi.python.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27
+PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
+PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
+PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
